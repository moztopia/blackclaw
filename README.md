# Darkclaw

Darkclaw is a public, unofficial OpenAPI specification, documentation project,
and collection of generated API clients for the Darkpaw Games Census API.

**Darkclaw is not affiliated with or endorsed by Darkpaw Games.**

The project makes Census easier to discover and use across programming
languages. It combines generic Census operations with progressively typed
game-specific coverage. EverQuest II is the first typed namespace; generic
collection access remains available for EQ2, PlanetSide 2, DC Universe Online,
Magic: The Gathering Online, and other Census namespaces.

The public documentation website is
[darkclaw.mozrin.com](https://darkclaw.mozrin.com).

Contributors are welcome. Whether you are improving a schema, adding a client
generator, documenting an upstream behavior, writing tests, or refining the
website, see [Contributing](#contributing) for a safe place to begin.

## Repository overview

| Path | Purpose | Documentation |
| --- | --- | --- |
| `packages/contracts/` | Canonical OpenAPI contract, generator configurations, and repeatable Census snapshots | [Contract guide](packages/contracts/README.md) |
| `packages/darkclaw-census-api-client-*` | Disposable clients generated from the canonical contract | Generated README and API docs in each package |
| `cli/` | Generated-client test harness for the Darkclaw API | [CLI guide](cli/README.md) |
| `website/` | Public Darkclaw documentation and marketing website | [Website guide](website/README.md) |
| `api/` | Laravel proxy implementing the modern Darkclaw API | [API guide](api/README.md) |
| `app/` | Flutter application scaffold | [App guide](app/README.md) |
| `scripts/` | Contract validation, client generation, and snapshot tooling | Source and command help |

[`packages/contracts/darkclaw.openapi.yaml`](packages/contracts/darkclaw.openapi.yaml)
is the canonical public API contract. Generated packages must never be
edited manually because `make contract-generate` deletes and recreates them.

## Getting started

The contract and CLI require Python 3.9 or newer. Full client generation and
website development also require Docker, Node.js, npm, Flutter, and Dart.

```sh
git clone git@github.com:mozrin/blackclaw.git
cd blackclaw
make contract-validate
make contract-generate
make test-clients
```

For the Laravel and React documentation site, start
[moztopia/dugout](https://github.com/moztopia/dugout) first, then run:

```sh
make setup
make up
```

The local website is available at <http://blackclaw.localhost>.

## Census CLI

Blackclaw includes a comprehensive test harness for the generated Python client
and the modern Laravel proxy. Install its local environment before first use:

```sh
make install-cli
./cli/blackclaw --help
./cli/blackclaw collections eq2
./cli/blackclaw characters --name Zarenda --page-size 1
./cli/blackclaw character 463858770551
./cli/blackclaw models Character
```

The proxy owns all Census-specific service IDs and transport conventions. See
the [CLI guide](cli/README.md) for commands, configuration, and tests.

## Contract workflow

Darkclaw uses a contract-first, evidence-backed workflow:

1. Capture or check upstream behavior with the snapshot tools.
2. Curate the behavior into the canonical OpenAPI document.
3. Validate the contract and its project conventions.
4. Regenerate every configured client from scratch.
5. Build and test the generated packages before review.

```sh
make snapshot-eq2
make snapshot-eq2-check
make contract-validate
make contract-generate
make contract-check-generated
make test-clients
```

OpenAPI Generator is pinned to `v7.22.0`. The first client milestone covers
`dart-dio`, standard `python`, and `typescript-axios`. The planned generator
matrix and snapshot rules are documented in the
[contract guide](packages/contracts/README.md).

## Contributing

Contributions of all sizes are invited. Good first contributions include
correcting documentation, adding contract examples, expanding snapshot tests,
improving generated-client verification, and documenting Census quirks.

Before opening a pull request:

1. Read the [contract guide](packages/contracts/README.md) and the README for
   the component you are changing.
2. Keep the canonical contract generic where Census is dynamic and add typed
   operations only when repeatable upstream evidence supports them.
3. Never hand-edit generated clients. Change the contract, generator
   configuration, or tracked template and regenerate instead.
4. Add or update tests for behavior changes.
5. Run the relevant checks below and describe the results in the pull request.
6. Keep each commit focused and avoid including unrelated generated or local
   files.

| Change | Minimum verification |
| --- | --- |
| Contract or generator | `make contract-validate && make contract-generate && make test-clients` |
| Snapshot tooling | `make test-contract && make snapshot-eq2-check` |
| CLI | `make test-cli` |
| Laravel API | `make test-api` |
| Website | `make test-website` |
| Cross-cutting work | `make test` |

Please open an issue or discussion before investing in a large new namespace,
generator family, or architectural change. That keeps parallel efforts aligned
and makes review faster.

## Documentation

- [Canonical contract](packages/contracts/darkclaw.openapi.yaml)
- [Contract, generation, and snapshot rules](packages/contracts/README.md)
- [EQ2 snapshot methodology](packages/contracts/snapshots/eq2/README.md)
- [Generated Python client](packages/darkclaw-census-api-client-python/README.md)
- [Generated TypeScript/Axios client](packages/darkclaw-census-api-client-typescript-axios/README.md)
- [Generated Dart/Dio client](packages/darkclaw-census-api-client-dart-dio/README.md)
- [CLI usage](cli/README.md)
- [Website development](website/README.md)
- [API development](api/README.md)
- [Project history](CHANGELOG.md)

The generated package documentation is rebuilt with the clients. Durable
project guidance belongs in the contract guide, component READMEs, or this
README.
