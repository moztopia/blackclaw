#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

# --- .env -------------------------------------------------------------------
if [[ ! -s .env ]]; then
  if [[ ! -f .env.example ]]; then
    echo "ERROR: .env.example not found. Cannot continue." >&2
    exit 1
  fi
  cp .env.example .env
fi

# Default APP_NAME to the project directory name if not already set
if ! grep -q '^APP_NAME=' .env; then
  echo "APP_NAME=$(basename "${ROOT_DIR}")" >> .env
fi

APP_NAME="$(sed -n 's/^APP_NAME=//p' .env)"

# --- Deploy workflow ---------------------------------------------------------
# Activate the deploy workflow from its .template copy so the template repo
# itself never triggers deploys, but new projects get a working workflow.
if [[ -f .github/workflows/deploy.yaml.template && ! -f .github/workflows/deploy.yaml ]]; then
  mv .github/workflows/deploy.yaml.template .github/workflows/deploy.yaml
fi

# --- API .env ----------------------------------------------------------------
if [[ ! -s api/.env ]]; then
  if [[ ! -f api/.env.example ]]; then
    echo "ERROR: api/.env.example not found. Cannot continue." >&2
    exit 1
  fi

  # Build the file beside its destination, then rename it into place. Renaming
  # only requires ownership of the directory, so this also repairs an empty
  # root-owned placeholder left behind by a container without using sudo.
  API_ENV_TMP="$(mktemp "${ROOT_DIR}/api/.env.setup.XXXXXX")"
  trap 'rm -f -- "${API_ENV_TMP:-}"' EXIT
  cp api/.env.example "${API_ENV_TMP}"
  mv -f -- "${API_ENV_TMP}" api/.env
  trap - EXIT

  sed -i "s|^APP_NAME=$|APP_NAME=${APP_NAME}|" api/.env
  sed -i "s|^DB_DATABASE=app$|DB_DATABASE=${APP_NAME}|" api/.env
  sed -i "s|^DB_USERNAME=app$|DB_USERNAME=${APP_NAME}|" api/.env
  sed -i "s|^DB_PASSWORD=app$|DB_PASSWORD=${APP_NAME}|" api/.env
fi

if grep -q '^APP_KEY=$' api/.env; then
  APP_KEY="base64:$(openssl rand -base64 32 | tr -d '\n')"
  sed -i "s|^APP_KEY=$|APP_KEY=${APP_KEY}|" api/.env
fi

# --- Generate & install ------------------------------------------------------
./scripts/generate-clients.sh
npm install --prefix website
(
  cd packages/darkclaw-census-api-client-dart-dio
  dart pub get
  dart run build_runner build --delete-conflicting-outputs
)

# --- Docker ------------------------------------------------------------------
docker compose up --build --detach

echo "Waiting for API to be ready..."
until docker compose exec api php artisan --version &>/dev/null; do
  sleep 2
done

docker compose exec api php artisan migrate --force

echo
echo "${APP_NAME^} is ready:"
echo "  Website: http://${APP_NAME}.localhost"
echo "  API:     http://${APP_NAME}.localhost/api/v1/status"
echo "  Mobile:  make run-app"
