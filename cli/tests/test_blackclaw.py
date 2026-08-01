"""Tests for the generated-client Darkclaw CLI."""

from __future__ import annotations

import importlib.util
import io
import json
import unittest
from pathlib import Path
from typing import Any


def load_cli() -> Any:
    path = Path(__file__).parents[1] / "blackclaw.py"
    spec = importlib.util.spec_from_file_location("blackclaw_cli", path)
    if spec is None or spec.loader is None:
        raise RuntimeError("could not load cli/blackclaw.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


cli = load_cli()


class RecordingApi:
    def __init__(self, calls: list[Any]) -> None:
        self.calls = calls

    def __getattr__(self, name: str) -> Any:
        def invoke(*args: Any, **kwargs: Any) -> dict[str, Any]:
            self.calls.append((name, args, kwargs))
            return {"operation": name}

        return invoke


class BlackclawTest(unittest.TestCase):
    def invoke(self, arguments: list[str]) -> tuple[int, Any, list[Any]]:
        calls: list[Any] = []

        def factory(host: str) -> Any:
            calls.append(("host", host))
            api = RecordingApi(calls)
            return cli.Clients(object(), api, api, api)

        stdout = io.StringIO()
        code = cli.run(
            arguments,
            stdout=stdout,
            stderr=io.StringIO(),
            client_factory=factory,
        )
        return code, json.loads(stdout.getvalue()), calls

    def test_collections_uses_discovery_api(self) -> None:
        code, payload, calls = self.invoke(["collections", "eq2"])
        self.assertEqual(0, code)
        self.assertEqual({"operation": "list_collections"}, payload)
        self.assertEqual(("eq2",), calls[1][1])

    def test_advanced_record_operations_are_available(self) -> None:
        _code, _payload, calls = self.invoke([
            "records", "eq2", "item", "--page-size", "5",
            "--sort=-name",
        ])
        self.assertEqual("list_collection_records", calls[1][0])
        self.assertEqual(5, calls[1][2]["page_size"])
        self.assertEqual("-name", calls[1][2]["sort"])

        _code, _payload, calls = self.invoke([
            "record", "eq2", "item", "123"
        ])
        self.assertEqual("get_collection_record", calls[1][0])
        self.assertEqual(("eq2", "item", "123"), calls[1][1])

    def test_character_search_maps_modern_filters(self) -> None:
        _code, _payload, calls = self.invoke([
            "characters", "--name", "Zarenda", "--class", "Wizard",
            "--minimum-level", "100", "--sort=-level",
        ])
        name, _args, kwargs = calls[1]
        self.assertEqual("list_characters", name)
        self.assertEqual("Zarenda", kwargs["name"])
        self.assertEqual("Wizard", kwargs["class_name"])
        self.assertEqual(100, kwargs["minimum_level"])
        self.assertEqual("-level", kwargs["sort"])

    def test_get_character_uses_typed_api(self) -> None:
        _code, _payload, calls = self.invoke(["character", "463858770551"])
        self.assertEqual("get_character", calls[1][0])
        self.assertEqual(("463858770551",), calls[1][1])

    def test_models_exposes_generated_schema(self) -> None:
        code, payload, _calls = self.invoke(["models", "Character"])
        self.assertEqual(0, code)
        self.assertEqual("Character", payload["title"])


if __name__ == "__main__":
    unittest.main()
