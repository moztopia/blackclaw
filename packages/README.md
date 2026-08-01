# Darkclaw packages

- `contracts/` owns the canonical Census OpenAPI document, generator configurations,
  template overrides, and upstream snapshots.
- `darkclaw-census-api-client-<generatorName>/` directories are generated from that one
  Census contract and must not be edited manually.
- The future Darkclaw website backend client is a separate package family named
  `darkclaw-website-api-client-typescript-axios` and will not use the Census contract.

Run `make contract-generate` after contract changes and `make test-clients` before review.
