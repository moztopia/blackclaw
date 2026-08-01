# Shared packages

This directory is the contract boundary between the Laravel API, Flutter app,
and React website.

## Contents

- `contracts/openapi.yaml` is the canonical public API contract.
- `api-client-dart/` is generated for `app/`.
- `api-client-typescript/` is generated for `website/`.

Change the OpenAPI document first, then run `make generate`. Generated clients
must not be edited by hand. The API implements the contract; it does not expose
Eloquent models or database types directly to clients.

The generator version and options are pinned in `scripts/generate-clients.sh`
and the YAML files under `contracts/`.
