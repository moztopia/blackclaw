#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATOR_IMAGE="openapitools/openapi-generator-cli:v7.22.0"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "${ROOT_DIR}:/workspace" \
  "${GENERATOR_IMAGE}" validate \
  --input-spec /workspace/packages/contracts/openapi.yaml

rm -rf \
  "${ROOT_DIR}/packages/api-client-dart" \
  "${ROOT_DIR}/packages/api-client-typescript"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "${ROOT_DIR}:/workspace" \
  "${GENERATOR_IMAGE}" generate \
  --config /workspace/packages/contracts/dart.yaml

docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "${ROOT_DIR}:/workspace" \
  "${GENERATOR_IMAGE}" generate \
  --config /workspace/packages/contracts/typescript-fetch.yaml

# Fix TypeScript compiler issues in generated configs
node -e "
const fs = require('fs');
const files = [
  '${ROOT_DIR}/packages/api-client-typescript/tsconfig.json',
  '${ROOT_DIR}/packages/api-client-typescript/tsconfig.esm.json'
];
for (const file of files) {
  if (fs.existsSync(file)) {
    const data = JSON.parse(fs.readFileSync(file, 'utf8'));
    if (!data.compilerOptions) data.compilerOptions = {};
    delete data.compilerOptions.ignoreDeprecations;
    data.compilerOptions.moduleResolution = 'node16';
    data.compilerOptions.module = 'Node16';
    data.compilerOptions.rootDir = './src';
    fs.writeFileSync(file, JSON.stringify(data, null, 2));
  }
}
"

# Ignore TODO errors in the generated Dart client
cat <<EOF > "${ROOT_DIR}/packages/api-client-dart/analysis_options.yaml"
analyzer:
  errors:
    todo: ignore
EOF

echo "Generated Dart and TypeScript clients from packages/contracts/openapi.yaml"
