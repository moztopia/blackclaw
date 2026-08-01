SHELL := /usr/bin/env bash

APP_NAME := $(shell sed -n 's/^APP_NAME=//p' .env 2>/dev/null)
DART_DEFINES := --dart-define=API_BASE_URL=http://$(APP_NAME).localhost

.PHONY: setup generate contract-validate contract-generate contract-check-generated \
	snapshot-eq2 snapshot-eq2-check test test-contract test-clients test-client-dart-dio \
	test-client-python test-client-typescript-axios install-cli test-cli test-app test-api test-website \
	up down logs migrate build run-app

setup:
	./scripts/setup.sh

generate: contract-generate

contract-validate:
	./scripts/validate-contract.sh

contract-generate:
	./scripts/generate-clients.sh

contract-check-generated:
	./scripts/check-generated-clients.sh

snapshot-eq2:
	python3 scripts/census_snapshot.py capture --namespace eq2 --collections character

snapshot-eq2-check:
	python3 scripts/census_snapshot.py check --namespace eq2 --collections character

test: test-contract test-clients test-cli test-api test-website

test-contract: contract-validate
	python3 -m unittest discover -s tests -v

test-clients: test-client-dart-dio test-client-python test-client-typescript-axios

test-client-dart-dio:
	cd packages/darkclaw-census-api-client-dart-dio && dart pub get && dart run build_runner build && dart analyze && dart test

test-client-python:
	python3 -m venv packages/darkclaw-census-api-client-python/.venv
	packages/darkclaw-census-api-client-python/.venv/bin/pip install -q -e packages/darkclaw-census-api-client-python pytest
	packages/darkclaw-census-api-client-python/.venv/bin/python -m compileall -q packages/darkclaw-census-api-client-python/darkclaw_census_api_client
	packages/darkclaw-census-api-client-python/.venv/bin/pytest -q packages/darkclaw-census-api-client-python/test

test-client-typescript-axios:
	npm --prefix packages/darkclaw-census-api-client-typescript-axios install --no-audit --no-fund
	npm --prefix packages/darkclaw-census-api-client-typescript-axios run build

install-cli:
	python3 -m venv packages/darkclaw-census-api-client-python/.venv
	packages/darkclaw-census-api-client-python/.venv/bin/pip install -q -e packages/darkclaw-census-api-client-python

test-cli:
	packages/darkclaw-census-api-client-python/.venv/bin/python -m unittest discover -s cli/tests -v

up:
	docker compose up --build -d

down:
	docker compose down

logs:
	docker compose logs --follow api website

migrate:
	docker compose exec api php artisan migrate

test-api:
	docker compose run --rm api php artisan test

test-website:
	npm --prefix website test -- --run
	npm --prefix website run build

test-app:
	cd app && flutter analyze && flutter test $(DART_DEFINES)

run-app:
	cd app && flutter run $(DART_DEFINES)

build:
	docker compose build
