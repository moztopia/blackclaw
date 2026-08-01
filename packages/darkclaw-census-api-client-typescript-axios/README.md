## @darkclaw/census-api-client@0.2.0

This generator creates TypeScript/JavaScript client that utilizes [axios](https://github.com/axios/axios). The generated Node module can be used in the following environments:

Environment
* Node.js
* Webpack
* Browserify

Language level
* ES5 - you must have a Promises/A+ library installed
* ES6

Module system
* CommonJS
* ES6 module system

It can be used in both TypeScript and JavaScript. In TypeScript, the definition will be automatically resolved via `package.json`. ([Reference](https://www.typescriptlang.org/docs/handbook/declaration-files/consumption.html))

### Building

To build and compile the typescript sources to javascript use:
```
npm install
npm run build
```

### Publishing

First build the package then run `npm publish`

### Consuming

navigate to the folder of your consuming project and run one of the following commands.

_published:_

```
npm install @darkclaw/census-api-client@0.2.0 --save
```

_unPublished (not recommended):_

```
npm install PATH_TO_GENERATED_PACKAGE --save
```

### Documentation for API Endpoints

All URIs are relative to *https://api.darkclaw.mozrin.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DiscoveryApi* | [**listCollections**](docs/DiscoveryApi.md#listcollections) | **GET** /v1/games/{gameId}/collections | List available collections
*EverQuestIICharactersApi* | [**getCharacter**](docs/EverQuestIICharactersApi.md#getcharacter) | **GET** /v1/games/eq2/characters/{characterId} | Get an EverQuest II character
*EverQuestIICharactersApi* | [**listCharacters**](docs/EverQuestIICharactersApi.md#listcharacters) | **GET** /v1/games/eq2/characters | Search EverQuest II characters
*RecordsApi* | [**getCollectionRecord**](docs/RecordsApi.md#getcollectionrecord) | **GET** /v1/games/{gameId}/collections/{collectionId}/records/{recordId} | Get an untyped collection record
*RecordsApi* | [**listCollectionRecords**](docs/RecordsApi.md#listcollectionrecords) | **GET** /v1/games/{gameId}/collections/{collectionId}/records | List records from an untyped collection


### Documentation For Models

 - [Character](docs/Character.md)
 - [CharacterLocation](docs/CharacterLocation.md)
 - [CharacterName](docs/CharacterName.md)
 - [CharacterPage](docs/CharacterPage.md)
 - [CharacterProfile](docs/CharacterProfile.md)
 - [CharacterResponse](docs/CharacterResponse.md)
 - [Collection](docs/Collection.md)
 - [CollectionListResponse](docs/CollectionListResponse.md)
 - [GenericRecordPage](docs/GenericRecordPage.md)
 - [GenericRecordResponse](docs/GenericRecordResponse.md)
 - [PageMetadata](docs/PageMetadata.md)
 - [Problem](docs/Problem.md)


<a id="documentation-for-authorization"></a>
## Documentation For Authorization

Endpoints do not require authorization.

