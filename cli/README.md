# Blackclaw CLI

`blackclaw` exercises every operation and model in the generated Darkclaw
Python client. It calls the modern Laravel proxy, never Census directly.

## Install

```sh
make install-cli
ln -s "$PWD/cli/blackclaw" ~/.local/bin/blackclaw
```

The default API URL is `http://blackclaw.localhost/api`. Override it with
`DARKCLAW_API_URL` or `--host`.

## Commands

| Command | Generated operation |
| --- | --- |
| `collections GAME` | `listCollections` |
| `records GAME COLLECTION` | `listCollectionRecords` |
| `record GAME COLLECTION ID` | `getCollectionRecord` |
| `characters` | `listCharacters` |
| `character ID` | `getCharacter` |
| `models [NAME]` | List or inspect generated Pydantic models |

Examples:

```sh
blackclaw collections eq2
blackclaw records eq2 item --page-size 5
blackclaw character 463858770551
blackclaw characters --name Zarenda --server Butcherblock
blackclaw characters --class Wizard --minimum-level 100 --sort=-level
blackclaw models Character
```

Use `--output compact` for scripts and `--quiet` to suppress progress. JSON is
written to standard output and diagnostics are written to standard error.

## Tests

```sh
make test-cli
```

The unit suite uses fake generated API objects and does not require a running
Darkclaw or Census service.
