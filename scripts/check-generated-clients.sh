#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATORS=(dart-dio python typescript-axios)

"${ROOT_DIR}/scripts/generate-clients.sh"

dirty=0
for generator in "${GENERATORS[@]}"; do
  if [[ -n "$(git -C "${ROOT_DIR}" status --porcelain -- "packages/darkclaw-census-api-client-${generator}")" ]]; then
    git -C "${ROOT_DIR}" status --short -- "packages/darkclaw-census-api-client-${generator}"
    dirty=1
  fi
done

if [[ "${dirty}" -ne 0 ]]; then
  echo "Generated clients differ from committed output." >&2
  exit 1
fi

echo "Generated clients match committed output."
