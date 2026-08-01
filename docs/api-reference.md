# Darkclaw API reference

Darkclaw provides a modern, stable API over data sourced from Darkpaw Games
Census. Consumers use Darkclaw resource names, ordinary query parameters,
cursor pagination, camelCase JSON, and RFC 9457 errors; Census details remain
inside the proxy.

The canonical
[`darkclaw.openapi.yaml`](../packages/contracts/darkclaw.openapi.yaml)
contract is authoritative. Darkclaw is unofficial and is not affiliated with
or endorsed by Darkpaw Games.

## Contents

- [Conventions](#conventions)
- [Discovery](#discovery)
  - [List collections](#list-collections)
- [Advanced records](#advanced-records)
  - [List collection records](#list-collection-records)
  - [Get a collection record](#get-a-collection-record)
- [EverQuest II characters](#everquest-ii-characters)
  - [List characters](#list-characters)
  - [Get a character](#get-a-character)
- [Models](#models)
- [Generated methods](#generated-methods)

## Conventions

| Concern | Darkclaw convention |
| --- | --- |
| Production URL | `https://api.darkclaw.mozrin.com` |
| Local URL | `http://blackclaw.localhost/api` |
| Versioning | `/v1` path prefix |
| Property names | camelCase |
| Pagination | Opaque `cursor` and bounded `pageSize` |
| Field selection | Comma-separated `fields` |
| Sorting | `sort`, with `-` for descending order |
| Errors | RFC 9457 `application/problem+json` |

Collection responses use `{ "data": [...], "page": {...} }`. Single-resource
responses use `{ "data": {...} }`. The maximum page size is 100 and the
default is 20.

Public game IDs are stable short codes:

| Game ID | Game or dataset |
| --- | --- |
| `eq` | EverQuest |
| `eq2` | EverQuest II |
| `mtg` | Magic: The Gathering Online |
| `dcu` | DC Universe Online |
| `ps` | PlanetSide |
| `ps2` | PlanetSide 2 |
| `ps2ps4us` | PlanetSide 2 on PlayStation, US |
| `ps2ps4eu` | PlanetSide 2 on PlayStation, EU |

These IDs are part of the Darkclaw contract. The proxy translates them to
upstream Census namespaces, including upstream version suffixes.

## Discovery

### List collections

```http
GET /v1/games/{gameId}/collections
```

Lists data collections available for a supported game. Collection descriptors
contain a stable ID, record count, visibility, indexes, and resolvers.

| Item | Value |
| --- | --- |
| Operation ID | `listCollections` |
| Path parameters | `gameId` (for example, `eq2`, `ps2`, or `dcu`) |
| Response | `CollectionListResponse` |

## Advanced records

These endpoints are an escape hatch for collections without a typed Darkclaw
resource. Applications should prefer typed endpoints whenever one exists.

### List collection records

```http
GET /v1/games/{gameId}/collections/{collectionId}/records
```

| Item | Value |
| --- | --- |
| Operation ID | `listCollectionRecords` |
| Path parameters | `gameId`, `collectionId` |
| Query parameters | `pageSize`, `cursor`, `fields`, `sort`, `language` |
| Response | `GenericRecordPage` |

### Get a collection record

```http
GET /v1/games/{gameId}/collections/{collectionId}/records/{recordId}
```

| Item | Value |
| --- | --- |
| Operation ID | `getCollectionRecord` |
| Path parameters | `gameId`, `collectionId`, `recordId` |
| Query parameters | `fields`, `language` |
| Response | `GenericRecordResponse` |
| Missing record | `404` problem details |

## EverQuest II characters

### List characters

```http
GET /v1/games/eq2/characters
```

Searches characters and returns normalized `Character` resources.

| Item | Value |
| --- | --- |
| Operation ID | `listCharacters` |
| Filters | `name`, `server`, `className`, `minimumLevel`, `maximumLevel` |
| Paging | `pageSize`, `cursor` |
| Projection | `fields`, `language` |
| Sort values | `name`, `level`, `updatedAt`; prefix with `-` to descend |
| Response | `CharacterPage` |

Example:

```http
GET /v1/games/eq2/characters?name=Zarenda&pageSize=20
```

### Get a character

```http
GET /v1/games/eq2/characters/{characterId}
```

| Item | Value |
| --- | --- |
| Operation ID | `getCharacter` |
| Path parameters | Numeric-string `characterId` |
| Query parameters | `fields`, `language` |
| Response | `CharacterResponse` |
| Missing character | `404` problem details |

## Models

| Model | Purpose |
| --- | --- |
| `Collection` | Discoverable advanced collection metadata |
| `GenericRecordPage` | Cursor-paginated untyped records |
| `Character` | Stable EverQuest II character resource |
| `CharacterName` | First and last name |
| `CharacterProfile` | Class, race, level, gender, deity, and alignment |
| `CharacterLocation` | Server, zone, and coordinates |
| `PageMetadata` | Page size, returned count, and next cursor |
| `Problem` | RFC 9457 error details |

`Character` intentionally contains only fields Darkclaw has promoted into its
stable public model. New typed fields are added from repeatable Census snapshots
without leaking upstream naming or response structure.

## Generated methods

| Operation | Python | Dart Dio | TypeScript Axios |
| --- | --- | --- | --- |
| List collections | `list_collections` | `listCollections` | `listCollections` |
| List advanced records | `list_collection_records` | `listCollectionRecords` | `listCollectionRecords` |
| Get advanced record | `get_collection_record` | `getCollectionRecord` | `getCollectionRecord` |
| List characters | `list_characters` | `listCharacters` | `listCharacters` |
| Get character | `get_character` | `getCharacter` | `getCharacter` |

Every new public endpoint must be added to the canonical contract, implemented
by the Laravel proxy, tested with a mocked upstream response, and listed here in
the same change.
