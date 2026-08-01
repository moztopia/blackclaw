#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

# --- .env -------------------------------------------------------------------
if [[ ! -f .env ]]; then
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
if [[ ! -f api/.env ]]; then
  if [[ ! -f api/.env.example ]]; then
    echo "ERROR: api/.env.example not found. Cannot continue." >&2
    exit 1
  fi
  cp api/.env.example api/.env
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
(cd packages/api-client-dart && dart pub get)
(cd app && flutter pub get)

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

