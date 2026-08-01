SHELL := /usr/bin/env bash

# Read APP_NAME from .env (set by make setup)
APP_NAME := $(shell sed -n 's/^APP_NAME=//p' .env 2>/dev/null)
DART_DEFINES := --dart-define=API_BASE_URL=http://$(APP_NAME).localhost

.PHONY: setup generate up down logs migrate test test-app test-api test-website build run-app

setup:
	./scripts/setup.sh

generate:
	./scripts/generate-clients.sh

up:
	docker compose up --build -d

down:
	docker compose down

logs:
	docker compose logs --follow api website

migrate:
	docker compose exec api php artisan migrate

test: test-api test-website test-app

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
