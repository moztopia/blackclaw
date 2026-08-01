# Monorepo API

Laravel 13 JSON API for the mobile app and public website. The shared
contract lives at [`../packages/contracts/openapi.yaml`](../packages/contracts/openapi.yaml);
API responses should implement that contract rather than expose Eloquent models
directly.

## Runtime

- PHP 8.3 or newer
- Laravel 13
- MariaDB for persistent data
- Redis for cache, sessions, and queues
- Laravel Socialite plus the installed Apple, Facebook, GitHub, Google, and LINE providers

This service has no JavaScript build step. Vite belongs to the website development
workflow, not the API runtime.

## Docker Compose setup

From the repository root:

```sh
cp api/.env.example api/.env
docker compose up --build api database cache
docker compose exec api php artisan migrate
```

The root `.env` configures the Compose services. The `DB_DATABASE`, `DB_USERNAME`,
and `DB_PASSWORD` values in `api/.env` must match the corresponding root values.
Inside Compose, Laravel reaches MariaDB at `database:3306` and Redis at
`cache:6379`, as shown in `.env.example`.

To run Artisan directly on the host while using the ports exposed by the local
Compose override, change `DB_HOST` and `REDIS_HOST` in `api/.env` to
`127.0.0.1`.

## Development commands

Run commands from this directory unless noted otherwise:

```sh
composer install
php artisan migrate
composer test
composer run dev
```

`composer run dev` serves the API at <http://localhost:8000>. Queue workers are
separate long-running processes and can be started when the application begins
dispatching jobs:

```sh
php artisan queue:work
```

## Scaffold endpoint

`GET /api/v1/status` returns an unwrapped `StatusResponse` object:

```json
{
  "status": "ok",
  "service": "monorepo-api",
  "timestamp": "2026-07-12T00:00:00+00:00"
}
```

Laravel also exposes its lightweight infrastructure health route at `GET /up`.
