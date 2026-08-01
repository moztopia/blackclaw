# Changelog

All notable changes to the **Monorepo Template** are documented in this file.

---

## [1.0.0] — Pinto — 2026-07-18

### Added

- **Quick Start guide** in README.md showing how to create a repository from the GitHub template, check prerequisites, and run `make setup`.
- **moztopia/dugout documentation** — explained the external `moznet` network dependency for local development, including shared tools (Adminer, Portainer) and the nginx reverse proxy.
- **Production deployment section** in README.md describing Cloudflare tunnel mode with no external network required.
- **Makefile Command Reference** — detailed documentation for every Makefile target (`setup`, `generate`, `up`, `down`, `logs`, `migrate`, `test`, `test-api`, `test-website`, `test-app`, `build`).
- **Auto-detected `APP_NAME`** — `setup.sh` now defaults `APP_NAME` to the project directory name so the scaffold works with zero configuration.
- **Configurable image versions** — all Docker base images (`php`, `composer`, `node`, `mariadb`, `redis`, `nginx`, `cloudflared`) are configurable via `.env` variables, defaulting to `latest`.
- **Fully documented `.env.example`** — inline comments for every variable with usage examples and defaults.
- **VS Code startup editor** — `.vscode/settings.json` now opens `README.md` in preview when the workspace is opened for the first time.

### Changed

- **Internal Docker network** renamed from `${APP_NAME:-monorepo}` to a fixed `appnet` name. Docker Compose does not support variable interpolation in top-level YAML keys; using a fixed name ensures the network definition works regardless of `APP_NAME`. The actual Docker network is still project-scoped (e.g. `monotest_appnet`).
- **Dockerfile.api** — refactored Composer binary copy to use a named build stage (`composer_bin`) instead of inline `COPY --from=composer:...`, since `--from` does not support variable expansion.
- **Dockerfile.api / Dockerfile.website** — all `ARG` declarations used in `FROM` lines moved to global scope (before the first `FROM`).
- **Production note** corrected — the built-in proxy is nginx (not Caddy).
- **setup.sh** output now shows dynamic URLs based on the detected `APP_NAME`.

### Removed

- **`CLOUDFLARE_TUNNEL_TOKEN`** from `.env.example` — deployment-specific and defaults to empty in Compose; not needed in the template.
- **Hardcoded `.env` file** — deleted from the repository since all Compose variables have built-in defaults. `setup.sh` creates one from `.env.example` when needed.
