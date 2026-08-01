#!/usr/bin/env python3
"""Capture and compare deterministic Census collection/schema snapshots."""

from __future__ import annotations

import argparse
import json
import os
import sys
import time
import urllib.parse
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

TOOL_VERSION = "1"
BASE_URL = "https://census.daybreakgames.com"


def fetch_json(path: str, query: dict[str, str], service_id: str | None) -> dict[str, Any]:
    prefix = f"/s:{urllib.parse.quote(service_id, safe='')}" if service_id else ""
    url = f"{BASE_URL}{prefix}{path}?{urllib.parse.urlencode(query)}"
    request = urllib.request.Request(url, headers={"User-Agent": "darkclaw-snapshot/1"})
    with urllib.request.urlopen(request, timeout=30) as response:
        value = json.load(response)
    if not isinstance(value, dict):
        raise ValueError(f"Expected an object from {url}")
    if "error" in value:
        raise RuntimeError(f"Census returned an error for {url}: {value['error']}")
    return value


def normalize(value: Any) -> Any:
    if isinstance(value, dict):
        return {key: normalize(value[key]) for key in sorted(value)}
    if isinstance(value, list):
        return [normalize(item) for item in value]
    return value


def observed_type(value: Any) -> dict[str, Any]:
    if value is None:
        return {"types": ["null"]}
    if isinstance(value, bool):
        return {"types": ["boolean"]}
    if isinstance(value, int):
        return {"types": ["integer"]}
    if isinstance(value, float):
        return {"types": ["number"]}
    if isinstance(value, str):
        return {"types": ["string"]}
    if isinstance(value, list):
        item_schema: dict[str, Any] = {"types": []}
        for item in value:
            item_schema = merge_observations(item_schema, observed_type(item))
        return {"types": ["array"], "items": item_schema}
    if isinstance(value, dict):
        return {
            "types": ["object"],
            "properties": {key: observed_type(item) for key, item in sorted(value.items())},
        }
    raise TypeError(f"Unsupported JSON value: {type(value)!r}")


def merge_observations(left: dict[str, Any], right: dict[str, Any]) -> dict[str, Any]:
    result: dict[str, Any] = {"types": sorted(set(left.get("types", [])) | set(right.get("types", [])))}
    if "properties" in left or "properties" in right:
        properties: dict[str, Any] = {}
        left_properties = left.get("properties", {})
        right_properties = right.get("properties", {})
        for key in sorted(set(left_properties) | set(right_properties)):
            properties[key] = merge_observations(left_properties.get(key, {"types": []}), right_properties.get(key, {"types": []}))
        result["properties"] = properties
    if "items" in left or "items" in right:
        result["items"] = merge_observations(left.get("items", {"types": []}), right.get("items", {"types": []}))
    return result


def records_from_response(collection: str, response: dict[str, Any]) -> list[Any]:
    records = response.get(f"{collection}_list", [])
    if not isinstance(records, list):
        raise ValueError(f"Expected {collection}_list to be an array")
    return records


def snapshot(namespace: str, collections: list[str], sample_size: int, delay: float, service_id: str | None) -> dict[str, Any]:
    discovery = fetch_json(f"/get/{urllib.parse.quote(namespace, safe=':')}/", {"c:limit": "1000"}, service_id)
    descriptors = sorted(discovery.get("datatype_list", []), key=lambda item: item["name"])
    advertised = {item["name"] for item in descriptors}
    missing = sorted(set(collections) - advertised)
    if missing:
        raise ValueError(f"Collections not advertised by {namespace}: {', '.join(missing)}")

    examples: dict[str, Any] = {}
    schemas: dict[str, Any] = {}
    for index, collection in enumerate(collections):
        if index and delay:
            time.sleep(delay)
        response = fetch_json(
            f"/get/{urllib.parse.quote(namespace, safe=':')}/{urllib.parse.quote(collection, safe='.')}",
            {"c:limit": str(sample_size)},
            service_id,
        )
        examples[collection] = normalize(response)
        schema: dict[str, Any] = {"types": []}
        for record in records_from_response(collection, response):
            schema = merge_observations(schema, observed_type(record))
        schemas[collection] = schema

    return {
        "metadata": {
            "captured_at": datetime.now(timezone.utc).isoformat(),
            "namespace": namespace,
            "sample_size": sample_size,
            "sampled_collections": sorted(collections),
            "service_id_used": bool(service_id),
            "tool_version": TOOL_VERSION,
            "upstream_namespace_version": namespace.split(":", 1)[1] if ":" in namespace else None,
        },
        "collections": normalize({"datatype_list": descriptors, "returned": discovery.get("returned", len(descriptors))}),
        "examples": normalize(examples),
        "schemas": normalize(schemas),
    }


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def write_snapshot(root: Path, captured: dict[str, Any]) -> None:
    write_json(root / "metadata.json", captured["metadata"])
    write_json(root / "collections.json", captured["collections"])
    for name, value in captured["examples"].items():
        write_json(root / "examples" / f"{name}.json", value)
    for name, value in captured["schemas"].items():
        write_json(root / "schemas" / f"{name}.json", value)


def structural_view(captured: dict[str, Any]) -> dict[str, Any]:
    descriptors = []
    for descriptor in captured["collections"]["datatype_list"]:
        descriptors.append({key: value for key, value in descriptor.items() if key != "count"})
    return {"collections": descriptors, "schemas": captured["schemas"]}


def read_committed(root: Path, collections: list[str]) -> dict[str, Any]:
    return {
        "collections": json.loads((root / "collections.json").read_text(encoding="utf-8")),
        "schemas": {
            name: json.loads((root / "schemas" / f"{name}.json").read_text(encoding="utf-8"))
            for name in collections
        },
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("capture", "check"))
    parser.add_argument("--namespace", default="eq2")
    parser.add_argument("--collections", nargs="+", default=["character"])
    parser.add_argument("--sample-size", type=int, default=5)
    parser.add_argument("--delay", type=float, default=0.25)
    parser.add_argument("--output", type=Path, default=Path("packages/contracts/snapshots/eq2"))
    parser.add_argument("--service-id", default=os.environ.get("CENSUS_SERVICE_ID"))
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.sample_size < 1:
        raise ValueError("--sample-size must be at least 1")
    captured = snapshot(args.namespace, sorted(set(args.collections)), args.sample_size, args.delay, args.service_id)
    if args.command == "capture":
        write_snapshot(args.output, captured)
        print(f"Captured {args.namespace} snapshot in {args.output}")
        return 0

    expected = structural_view(read_committed(args.output, captured["metadata"]["sampled_collections"]))
    actual = structural_view(captured)
    if expected != actual:
        print("Upstream collection or observed schema drift detected.", file=sys.stderr)
        return 1
    print(f"No structural drift detected for {args.namespace}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
