#!/usr/bin/env python3
"""Enforce Darkclaw conventions not covered by OpenAPI Generator validation."""

from pathlib import Path


ROOT = Path(__file__).parents[1]
CONTRACT = ROOT / "packages" / "contracts" / "darkclaw.openapi.yaml"
EXPECTED = ("dart-dio", "python", "typescript-axios")


def main() -> int:
    text = CONTRACT.read_text(encoding="utf-8")
    failures: list[str] = []
    for required in (
        "openapi: 3.1.0",
        "title: Darkclaw API",
        "url: https://api.darkclaw.mozrin.com",
        "Darkclaw is unofficial",
        "operationId: listCollections",
        "operationId: listCollectionRecords",
        "operationId: getCollectionRecord",
        "operationId: listCharacters",
        "operationId: getCharacter",
        "application/problem+json",
    ):
        if required not in text:
            failures.append(f"contract is missing required text: {required}")
    for generator in EXPECTED:
        config = ROOT / "packages" / "contracts" / f"{generator}.yaml"
        if not config.exists():
            failures.append(f"missing generator config: {config.relative_to(ROOT)}")
            continue
        config_text = config.read_text(encoding="utf-8")
        if f"generatorName: {generator}" not in config_text:
            failures.append(f"generatorName does not match filename: {config.relative_to(ROOT)}")
        expected_output = f"outputDir: /workspace/packages/darkclaw-census-api-client-{generator}"
        if expected_output not in config_text:
            failures.append(f"outputDir does not retain generator name: {config.relative_to(ROOT)}")
    stale = (ROOT / "packages" / "contracts" / "dart.yaml", ROOT / "packages" / "contracts" / "typescript-fetch.yaml")
    for path in stale:
        if path.exists():
            failures.append(f"obsolete generator config remains: {path.relative_to(ROOT)}")
    if failures:
        print("\n".join(f"ERROR: {failure}" for failure in failures))
        return 1
    print("Darkclaw contract conventions are valid.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
