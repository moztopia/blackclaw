# Monorepo 🚀

A **contract‑first SaaS monorepo** template featuring a Flutter mobile app, Laravel JSON API, React/TypeScript website, and OpenAPI-generated cross-language clients.

---

> ⛔ **STOP!** This repo will not function correctly without at least walking through the Quick Start process below. Do not attempt to run `docker compose up` or any other commands before completing `make setup`.

## ⚡ Quick Start

### 1. Create Your Repository

Since this is a GitHub template, you can quickly boot up your own repository:

1. Click the **Use this template** button at the top of the GitHub repository page, then select **Create a new repository**.
2. Give your repository a name and clone it to your local machine.

### 2. Check Prerequisites

Ensure you have the following installed on your machine:

* **Docker** & **Docker Compose**
* **Node.js** & **npm** (for the website)
* **Flutter** & **Dart** (for the mobile application)
* **OpenSSL**

#### Local development network

Local development uses `docker-compose.override.yaml`, which disables the built-in proxy and Cloudflare tunnel services and instead connects the `api` and `website` containers to an external Docker network called `moznet`. This network — and the nginx reverse proxy that routes `*.localhost` traffic — is provided by the [moztopia/dugout](https://github.com/moztopia/dugout) development environment. Dugout also provides shared development tools such as Adminer and Portainer; by joining the `moznet` network, any locally running project is automatically exposed to that toolset. Clone and start `moztopia/dugout` before running `make setup`. See the [moztopia/dugout README](https://github.com/moztopia/dugout#readme) for more details.

### 3. Spin Up the Scaffold

From the root of the project, initialize the configuration files, generate API clients, install dependencies, and start the development containers in one step:

```bash
make setup
```

This command automates the following setup steps:

* Sets `APP_NAME` to the project directory name (e.g. cloning into `monotest/` → `APP_NAME=monotest`)
* Copies environment example files (`.env.example`)
* Creates application encryption keys
* Validates the OpenAPI document and regenerates the Dart and TypeScript clients
* Installs local dependencies for all services
* Starts the development Docker containers
* Runs Laravel database migrations

Once completed, you can access the local services (using the directory name as the subdomain):

* **React Website**: `http://<APP_NAME>.localhost`
* **Laravel API Status**: `http://<APP_NAME>.localhost/api/v1/status`
* **Flutter Mobile App**: Run `cd app && flutter run`

---

## 🛠 Technical Scaffold

This monorepo is built with four working areas:

* `app/` — Flutter mobile application
* `api/` — Laravel JSON API
* `packages/` — OpenAPI contract and generated Dart/TypeScript clients
* `website/` — React + TypeScript public website

### Contract‑first workflow

1. Edit `packages/contracts/openapi.yaml`
2. Run `make generate`
3. Implement the Laravel route and response
4. Use the generated clients in `app/` and `website/`
5. Run `make test`

Generated clients under `packages/api-client-*` must not be edited manually.

### Common commands

| Command | Description |
| --- | --- |
| `make setup` | One-time project initialisation |
| `make up` | Start / rebuild development containers |
| `make down` | Stop development containers |
| `make logs` | Tail API and website logs |
| `make migrate` | Run Laravel database migrations |
| `make generate` | Validate OpenAPI and regenerate clients |
| `make test` | Run all test suites |
| `make build` | Build all container images |

See the [Makefile Command Reference](#-makefile-command-reference) below for full details.

The Flutter app runs outside Docker. Android emulators use `http://10.0.2.2:8000` by default; override when needed:

```bash
cd app
flutter run --dart-define=API_BASE_URL=http://your-api-host:8000
```

### Production deployment

When deploying to a server, run only the base Compose file to skip the development override. This activates the built-in nginx `proxy` service (which routes `/api/*` to Laravel and everything else to the website) and the Cloudflare `tunnel` service for external access. The external `moznet` network is not needed.

```bash
docker compose -f docker-compose.yaml up --build -d
```

Production secrets, TLS/tunnel routing, backups, and hardened Laravel runtime require deployment‑specific configuration.

---

## 📖 Makefile Command Reference

### `make setup`

```bash
./scripts/setup.sh
```

Full first-run initialisation. This is the command you run once after cloning:

1. Copies `.env.example` → `.env` and `api/.env.example` → `api/.env` (if they don't already exist).
2. Sets `APP_NAME` to the project directory name if not already defined (e.g. `~/Code/monotest` → `APP_NAME=monotest`). This drives container names, the internal Docker network, and local URLs.
3. Generates a Laravel `APP_KEY` via OpenSSL and writes it to both env files.
4. Runs `make generate` (validates the OpenAPI contract and regenerates Dart and TypeScript clients).
5. Installs local dependencies — `npm install` for the website, `dart pub get` for the generated Dart client, and `flutter pub get` for the mobile app.
6. Starts all development containers via `docker compose up --build -d`.
7. Runs Laravel database migrations inside the API container.

---

### `make generate`

```bash
./scripts/generate-clients.sh
```

Validates `packages/contracts/openapi.yaml` against the OpenAPI spec, then regenerates both API clients from scratch using the [OpenAPI Generator](https://openapi-generator.tech/) Docker image:

* **Dart client** → `packages/api-client-dart/` (configured by `packages/contracts/dart.yaml`)
* **TypeScript client** → `packages/api-client-typescript/` (configured by `packages/contracts/typescript-fetch.yaml`)

After generation, the script patches the TypeScript `tsconfig.json` for Node 16 module resolution and suppresses `TODO` lint warnings in the Dart client.

> **Note:** Generated clients under `packages/api-client-*` must not be edited manually — changes will be overwritten on the next run.

---

### `make up`

```bash
docker compose up --build -d
```

Builds (or rebuilds) images and starts all development containers in detached mode. In local development, `docker-compose.override.yaml` is automatically applied, which:

* Switches the API and website to development build targets (with hot-reload via volume mounts).
* Connects containers to the external `moznet` network (provided by [moztopia/dugout](https://github.com/moztopia/dugout)).
* Disables the built-in `proxy` and `tunnel` services.

---

### `make down`

```bash
docker compose down
```

Stops and removes all containers for this project. Persistent volumes (database data, Redis data) are preserved.

---

### `make logs`

```bash
docker compose logs --follow api website
```

Tails the combined log output of the `api` (Laravel) and `website` (React dev server) containers. Press `Ctrl+C` to stop following.

---

### `make migrate`

```bash
docker compose exec api php artisan migrate
```

Runs pending Laravel database migrations inside the running API container. The containers must already be up (`make up`).

---

### `make test`

```bash
make test-api
make test-website
make test-app
```

Runs all three test suites in sequence. Equivalent to calling `test-api`, `test-website`, and `test-app` individually. Fails fast — if any suite fails the remaining suites are skipped.

---

### `make test-api`

```bash
docker compose run --rm api php artisan test
```

Spins up a disposable API container and runs the Laravel (PHPUnit) test suite against it.

---

### `make test-website`

```bash
npm --prefix website test -- --run
npm --prefix website run build
```

Runs the website unit tests, then performs a production build to catch any TypeScript or bundling errors.

---

### `make test-app`

```bash
cd app && flutter analyze && flutter test
```

Runs the Dart static analyser (`flutter analyze`) and the Flutter test suite on the mobile app. This runs on the host machine, not inside Docker.

---

### `make build`

```bash
docker compose build
```

Builds all container images without starting them. Useful for validating Dockerfile changes or pre-warming the build cache before a deploy.
