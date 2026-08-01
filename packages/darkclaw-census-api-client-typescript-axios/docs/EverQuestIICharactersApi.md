# EverQuestIICharactersApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**getCharacter**](#getcharacter) | **GET** /v1/games/eq2/characters/{characterId} | Get an EverQuest II character|
|[**listCharacters**](#listcharacters) | **GET** /v1/games/eq2/characters | Search EverQuest II characters|

# **getCharacter**
> CharacterResponse getCharacter()


### Example

```typescript
import {
    EverQuestIICharactersApi,
    Configuration
} from '@darkclaw/census-api-client';

const configuration = new Configuration();
const apiInstance = new EverQuestIICharactersApi(configuration);

let characterId: string; // (default to undefined)
let fields: string; //Comma-separated response fields to include. (optional) (default to undefined)
let language: 'en' | 'de' | 'es' | 'fr' | 'it' | 'ja'; //Preferred language for localized values. (optional) (default to 'en')

const { status, data } = await apiInstance.getCharacter(
    characterId,
    fields,
    language
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **characterId** | [**string**] |  | defaults to undefined|
| **fields** | [**string**] | Comma-separated response fields to include. | (optional) defaults to undefined|
| **language** | [**&#39;en&#39; | &#39;de&#39; | &#39;es&#39; | &#39;fr&#39; | &#39;it&#39; | &#39;ja&#39;**]**Array<&#39;en&#39; &#124; &#39;de&#39; &#124; &#39;es&#39; &#124; &#39;fr&#39; &#124; &#39;it&#39; &#124; &#39;ja&#39; &#124; &#39;11184809&#39;>** | Preferred language for localized values. | (optional) defaults to 'en'|


### Return type

**CharacterResponse**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The requested character. |  -  |
|**404** | Resource not found. |  -  |
|**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCharacters**
> CharacterPage listCharacters()


### Example

```typescript
import {
    EverQuestIICharactersApi,
    Configuration
} from '@darkclaw/census-api-client';

const configuration = new Configuration();
const apiInstance = new EverQuestIICharactersApi(configuration);

let pageSize: number; //Maximum records returned in this page. (optional) (default to 20)
let cursor: string; //Opaque cursor returned by the previous page. (optional) (default to undefined)
let fields: string; //Comma-separated response fields to include. (optional) (default to undefined)
let name: string; //Exact character first name. (optional) (default to undefined)
let server: string; //Exact server name. (optional) (default to undefined)
let className: string; //Exact adventure class name. (optional) (default to undefined)
let minimumLevel: number; // (optional) (default to undefined)
let maximumLevel: number; // (optional) (default to undefined)
let sort: 'name' | '-name' | 'level' | '-level' | 'updatedAt' | '-updatedAt'; //Character field, prefixed with `-` for descending order. (optional) (default to 'name')
let language: 'en' | 'de' | 'es' | 'fr' | 'it' | 'ja'; //Preferred language for localized values. (optional) (default to 'en')

const { status, data } = await apiInstance.listCharacters(
    pageSize,
    cursor,
    fields,
    name,
    server,
    className,
    minimumLevel,
    maximumLevel,
    sort,
    language
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **pageSize** | [**number**] | Maximum records returned in this page. | (optional) defaults to 20|
| **cursor** | [**string**] | Opaque cursor returned by the previous page. | (optional) defaults to undefined|
| **fields** | [**string**] | Comma-separated response fields to include. | (optional) defaults to undefined|
| **name** | [**string**] | Exact character first name. | (optional) defaults to undefined|
| **server** | [**string**] | Exact server name. | (optional) defaults to undefined|
| **className** | [**string**] | Exact adventure class name. | (optional) defaults to undefined|
| **minimumLevel** | [**number**] |  | (optional) defaults to undefined|
| **maximumLevel** | [**number**] |  | (optional) defaults to undefined|
| **sort** | [**&#39;name&#39; | &#39;-name&#39; | &#39;level&#39; | &#39;-level&#39; | &#39;updatedAt&#39; | &#39;-updatedAt&#39;**]**Array<&#39;name&#39; &#124; &#39;-name&#39; &#124; &#39;level&#39; &#124; &#39;-level&#39; &#124; &#39;updatedAt&#39; &#124; &#39;-updatedAt&#39; &#124; &#39;11184809&#39;>** | Character field, prefixed with &#x60;-&#x60; for descending order. | (optional) defaults to 'name'|
| **language** | [**&#39;en&#39; | &#39;de&#39; | &#39;es&#39; | &#39;fr&#39; | &#39;it&#39; | &#39;ja&#39;**]**Array<&#39;en&#39; &#124; &#39;de&#39; &#124; &#39;es&#39; &#124; &#39;fr&#39; &#124; &#39;it&#39; &#124; &#39;ja&#39; &#124; &#39;11184809&#39;>** | Preferred language for localized values. | (optional) defaults to 'en'|


### Return type

**CharacterPage**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | A page of typed characters. |  -  |
|**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

