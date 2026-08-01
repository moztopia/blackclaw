#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATOR_IMAGE="openapitools/openapi-generator-cli:v7.22.0"
CONTRACT="/workspace/packages/contracts/darkclaw.openapi.yaml"
GENERATORS=(dart-dio python typescript-axios)

run_generator() {
  docker run --rm \
    --user "$(id -u):$(id -g)" \
    --volume "${ROOT_DIR}:/workspace" \
    "${GENERATOR_IMAGE}" "$@"
}

run_generator validate --input-spec "${CONTRACT}"

for generator in "${GENERATORS[@]}"; do
  output="${ROOT_DIR}/packages/darkclaw-census-api-client-${generator}"
  rm -rf "${output}"
  run_generator generate \
    --config "/workspace/packages/contracts/${generator}.yaml" \
    --global-property apiTests=true,modelTests=true
done

echo "Generated ${GENERATORS[*]} clients from packages/contracts/darkclaw.openapi.yaml"
