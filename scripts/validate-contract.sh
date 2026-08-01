#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATOR_IMAGE="openapitools/openapi-generator-cli:v7.22.0"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "${ROOT_DIR}:/workspace" \
  "${GENERATOR_IMAGE}" validate \
  --input-spec /workspace/packages/contracts/darkclaw.openapi.yaml

python3 "${ROOT_DIR}/scripts/validate_contract_conventions.py"
