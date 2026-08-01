# Darkclaw API

Laravel proxy implementing the modern Darkclaw game-data API. It translates
stable Darkclaw resources into upstream Census requests and normalizes the
responses.

The canonical contract is `../packages/contracts/darkclaw.openapi.yaml`. A
future website-only contract remains separate from the game-data API.

## Runtime

- PHP 8.3 or newer
- Laravel 13
- MariaDB for persistent website data
- Redis for cache, sessions, and queues

## Development

```bash
composer install
php artisan migrate
composer test
composer run dev
```

The existing `GET /api/v1/status` endpoint is website infrastructure and is not part of
the Census contract. Laravel also exposes `GET /up` for infrastructure health checks.
