# Darkclaw contracts

`darkclaw.openapi.yaml` is the canonical public Darkclaw data contract.
It describes the modern resources exposed by the Laravel proxy, not the legacy
Census wire API. The proxy owns translation of upstream paths, query parameters,
payloads, pagination, and errors.

A future `darkclaw-website.openapi.yaml` may describe website-only operations
such as waitlist management. Website operations remain separate from the public
game-data contract.

Generator configuration filenames and generated directories retain the exact OpenAPI
Generator name. Generated clients are disposable and must not be edited manually.

The `snapshots/` tree records deterministic observations of the upstream service. A
snapshot is evidence for reviewing the curated contract, not an authoritative schema and
not an input that automatically rewrites `openapi.yaml`.

Darkclaw releases use semantic versioning (`info.version`). Upstream namespace names and
snapshot capture metadata are recorded separately because upstream schemas can change
without a namespace version change.

Darkclaw is unofficial and is not affiliated with or endorsed by Darkpaw Games.

## Version 1 client matrix

Version 1 will support these exact OpenAPI Generator names, added and verified
incrementally:

`csharp`, `dart`, `dart-dio`, `elixir`, `go`, `java`, `java-helidon-client`,
`java-micronaut-client`, `javascript`, `kotlin`, `php`, `python`,
`python-pydantic-v1`, `ruby`, `rust`, `swift-combine`, `swift6`,
`typescript-angular`, `typescript-axios`, `typescript-fetch`, `typescript-node`, and
`typescript-rxjs`.

The first milestone generates `dart-dio`, `python`, and `typescript-axios`. Each later
configuration must be named `<generatorName>.yaml` and must output to
`packages/darkclaw-census-api-client-<generatorName>/`.
