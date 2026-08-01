#!/usr/bin/env python3
"""Exercise every operation in the generated Darkclaw Python client."""

from __future__ import annotations

import argparse
import json
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable, Sequence, TextIO


ROOT = Path(__file__).resolve().parents[1]
CLIENT_SOURCE = ROOT / "packages" / "darkclaw-census-api-client-python"
sys.path.insert(0, str(CLIENT_SOURCE))

import darkclaw_census_api_client as sdk  # noqa: E402
from darkclaw_census_api_client import models  # noqa: E402
from darkclaw_census_api_client.exceptions import (  # noqa: E402
    ApiException,
    OpenApiException,
)


DEFAULT_HOST = "http://blackclaw.localhost/api"
DEFAULT_TIMEOUT = 10.0
LANGUAGES = ("en", "de", "es", "fr", "it", "ja")
GAME_IDS = (
    "eq",
    "eq2",
    "mtg",
    "dcu",
    "ps",
    "ps2",
    "ps2ps4us",
    "ps2ps4eu",
)


@dataclass
class Clients:
    api_client: sdk.ApiClient
    discovery: sdk.DiscoveryApi
    records: sdk.RecordsApi
    characters: sdk.EverQuestIICharactersApi


def positive_int(value: str) -> int:
    parsed = int(value)
    if parsed < 1:
        raise argparse.ArgumentTypeError("must be at least 1")
    return parsed


def positive_float(value: str) -> float:
    parsed = float(value)
    if parsed <= 0:
        raise argparse.ArgumentTypeError("must be greater than zero")
    return parsed


def add_page_options(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("--page-size", type=positive_int, default=20)
    parser.add_argument("--cursor")
    parser.add_argument("--fields")
    parser.add_argument("--language", choices=LANGUAGES)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="blackclaw",
        description=(
            "Test the modern Darkclaw API through its generated Python client."
        ),
    )
    parser.add_argument(
        "--host",
        default=os.environ.get("DARKCLAW_API_URL", DEFAULT_HOST),
        help="Darkclaw API base URL",
    )
    parser.add_argument(
        "--timeout", type=positive_float, default=DEFAULT_TIMEOUT
    )
    parser.add_argument(
        "--output", choices=("pretty", "compact"), default="pretty"
    )
    parser.add_argument("--quiet", action="store_true")
    parser.add_argument("--version", action="version", version=sdk.__version__)
    commands = parser.add_subparsers(dest="command", required=True)

    collections = commands.add_parser(
        "collections", help="list game collections"
    )
    collections.add_argument("game", choices=GAME_IDS)

    records = commands.add_parser(
        "records", help="list advanced collection records"
    )
    records.add_argument("game", choices=GAME_IDS)
    records.add_argument("collection")
    add_page_options(records)
    records.add_argument("--sort")

    record = commands.add_parser(
        "record", help="get an advanced collection record"
    )
    record.add_argument("game", choices=GAME_IDS)
    record.add_argument("collection")
    record.add_argument("record_id")
    record.add_argument("--fields")
    record.add_argument("--language", choices=LANGUAGES)

    characters = commands.add_parser(
        "characters", help="search EQ2 characters"
    )
    add_page_options(characters)
    characters.add_argument("--name")
    characters.add_argument("--server")
    characters.add_argument("--class", dest="character_class")
    characters.add_argument("--minimum-level", type=positive_int)
    characters.add_argument("--maximum-level", type=positive_int)
    characters.add_argument(
        "--sort",
        choices=(
            "name", "-name", "level", "-level", "updatedAt", "-updatedAt"
        ),
    )

    character = commands.add_parser(
        "character", help="get an EQ2 character"
    )
    character.add_argument("character_id")
    character.add_argument("--fields")
    character.add_argument("--language", choices=LANGUAGES)

    model = commands.add_parser(
        "models", help="list or inspect generated models"
    )
    model.add_argument("name", nargs="?")
    return parser


def build_clients(host: str) -> Clients:
    configuration = sdk.Configuration(host=host.rstrip("/"))
    api_client = sdk.ApiClient(configuration)
    api_client.user_agent = f"blackclaw/{sdk.__version__}"
    return Clients(
        api_client,
        sdk.DiscoveryApi(api_client),
        sdk.RecordsApi(api_client),
        sdk.EverQuestIICharactersApi(api_client),
    )


def optional(options: argparse.Namespace, *names: str) -> dict[str, Any]:
    return {
        name: value
        for name in names
        if (value := getattr(options, name, None)) is not None
    }


def execute(options: argparse.Namespace, clients: Clients) -> Any:
    timeout = options.timeout
    if options.command == "collections":
        return clients.discovery.list_collections(
            options.game, _request_timeout=timeout
        )
    if options.command == "records":
        return clients.records.list_collection_records(
            options.game,
            options.collection,
            page_size=options.page_size,
            _request_timeout=timeout,
            **optional(options, "cursor", "fields", "sort", "language"),
        )
    if options.command == "record":
        return clients.records.get_collection_record(
            options.game,
            options.collection,
            options.record_id,
            _request_timeout=timeout,
            **optional(options, "fields", "language"),
        )
    if options.command == "characters":
        kwargs = optional(
            options,
            "cursor",
            "fields",
            "name",
            "server",
            "minimum_level",
            "maximum_level",
            "sort",
            "language",
        )
        if options.character_class is not None:
            kwargs["class_name"] = options.character_class
        return clients.characters.list_characters(
            page_size=options.page_size,
            _request_timeout=timeout,
            **kwargs,
        )
    if options.command == "character":
        return clients.characters.get_character(
            options.character_id,
            _request_timeout=timeout,
            **optional(options, "fields", "language"),
        )
    if options.command == "models":
        names = sorted(name for name in sdk.__all__ if hasattr(models, name))
        if options.name is None:
            return {"models": names, "count": len(names)}
        model_type = getattr(models, options.name, None)
        if model_type is None or not hasattr(model_type, "model_json_schema"):
            raise ValueError(f"unknown generated model: {options.name}")
        return model_type.model_json_schema()
    raise ValueError(f"unsupported command: {options.command}")


def jsonable(value: Any) -> Any:
    if hasattr(value, "to_dict"):
        return value.to_dict()
    if hasattr(value, "model_dump"):
        return value.model_dump(by_alias=True, exclude_none=True)
    return value


def run(
    arguments: Sequence[str],
    *,
    stdout: TextIO = sys.stdout,
    stderr: TextIO = sys.stderr,
    client_factory: Callable[[str], Clients] = build_clients,
) -> int:
    parser = build_parser()
    try:
        options = parser.parse_args(arguments)
        if not options.quiet:
            print(
                f"blackclaw: {options.command} via {options.host}",
                file=stderr,
                flush=True,
            )
        result = execute(options, client_factory(options.host))
        payload = jsonable(result)
        indent = 2 if options.output == "pretty" else None
        json.dump(payload, stdout, ensure_ascii=False, indent=indent)
        stdout.write("\n")
        return 0
    except (ApiException, OpenApiException) as error:
        print(f"blackclaw: API error: {error}", file=stderr)
        return 1
    except (OSError, ValueError) as error:
        print(f"blackclaw: {error}", file=stderr)
        return 1


def main() -> int:
    try:
        return run(sys.argv[1:])
    except BrokenPipeError:
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
