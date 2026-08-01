# Changelog

All notable changes to Darkclaw are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- Added the generated-client-based Python `blackclaw` test harness with all
  generic and typed operations, model schema inspection, Census query controls,
  custom hosts and service IDs, shell-friendly JSON, and unit tests.

### Changed

- Replaced the Census-shaped public contract with a versioned Darkclaw proxy
  API using resource paths, conventional filters, cursor pagination, camelCase
  models, and RFC 9457 problem responses.
- Regenerated the Dart Dio, Python, and TypeScript Axios clients at version
  0.2.0 and updated the CLI to exercise the modern generated operations.
- Replaced remaining repository-template `monorepo` names and settings with
  Blackclaw-specific names.
- Reworked the root README into a project overview, contributor invitation,
  workflow guide, and documentation index.

## [0.1.0] — 2026-08-01

### Added

- Added the canonical Darkclaw Census OpenAPI contract with generic collection
  operations and typed EverQuest II character coverage.
- Added pinned `dart-dio`, standard Python, and `typescript-axios` client
  generation.
- Added repeatable EQ2 upstream snapshots, contract-convention validation, and
  generated-client verification.
- Added the Darkclaw documentation website and its supporting Laravel backend.

### Changed

- Converted the original repository scaffold into the Darkclaw Census API
  documentation and client project.
