# RecordsApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**getCollectionRecord**](#getcollectionrecord) | **GET** /v1/games/{gameId}/collections/{collectionId}/records/{recordId} | Get an untyped collection record|
|[**listCollectionRecords**](#listcollectionrecords) | **GET** /v1/games/{gameId}/collections/{collectionId}/records | List records from an untyped collection|

# **getCollectionRecord**
> GenericRecordResponse getCollectionRecord()


### Example

```typescript
import {
    RecordsApi,
    Configuration
} from '@darkclaw/census-api-client';

const configuration = new Configuration();
const apiInstance = new RecordsApi(configuration);

let gameId: 'eq' | 'eq2' | 'mtg' | 'dcu' | 'ps' | 'ps2' | 'ps2ps4us' | 'ps2ps4eu'; //Stable Darkclaw game identifier. (default to undefined)
let collectionId: string; // (default to undefined)
let recordId: string; // (default to undefined)
let fields: string; //Comma-separated response fields to include. (optional) (default to undefined)
let language: 'en' | 'de' | 'es' | 'fr' | 'it' | 'ja'; //Preferred language for localized values. (optional) (default to 'en')

const { status, data } = await apiInstance.getCollectionRecord(
    gameId,
    collectionId,
    recordId,
    fields,
    language
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **gameId** | [**&#39;eq&#39; | &#39;eq2&#39; | &#39;mtg&#39; | &#39;dcu&#39; | &#39;ps&#39; | &#39;ps2&#39; | &#39;ps2ps4us&#39; | &#39;ps2ps4eu&#39;**]**Array<&#39;eq&#39; &#124; &#39;eq2&#39; &#124; &#39;mtg&#39; &#124; &#39;dcu&#39; &#124; &#39;ps&#39; &#124; &#39;ps2&#39; &#124; &#39;ps2ps4us&#39; &#124; &#39;ps2ps4eu&#39; &#124; &#39;11184809&#39;>** | Stable Darkclaw game identifier. | defaults to undefined|
| **collectionId** | [**string**] |  | defaults to undefined|
| **recordId** | [**string**] |  | defaults to undefined|
| **fields** | [**string**] | Comma-separated response fields to include. | (optional) defaults to undefined|
| **language** | [**&#39;en&#39; | &#39;de&#39; | &#39;es&#39; | &#39;fr&#39; | &#39;it&#39; | &#39;ja&#39;**]**Array<&#39;en&#39; &#124; &#39;de&#39; &#124; &#39;es&#39; &#124; &#39;fr&#39; &#124; &#39;it&#39; &#124; &#39;ja&#39; &#124; &#39;11184809&#39;>** | Preferred language for localized values. | (optional) defaults to 'en'|


### Return type

**GenericRecordResponse**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | The requested collection record. |  -  |
|**404** | Resource not found. |  -  |
|**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCollectionRecords**
> GenericRecordPage listCollectionRecords()

Advanced escape hatch for collections that do not yet have a typed Darkclaw resource. Prefer a typed endpoint when one exists. 

### Example

```typescript
import {
    RecordsApi,
    Configuration
} from '@darkclaw/census-api-client';

const configuration = new Configuration();
const apiInstance = new RecordsApi(configuration);

let gameId: 'eq' | 'eq2' | 'mtg' | 'dcu' | 'ps' | 'ps2' | 'ps2ps4us' | 'ps2ps4eu'; //Stable Darkclaw game identifier. (default to undefined)
let collectionId: string; // (default to undefined)
let pageSize: number; //Maximum records returned in this page. (optional) (default to 20)
let cursor: string; //Opaque cursor returned by the previous page. (optional) (default to undefined)
let fields: string; //Comma-separated response fields to include. (optional) (default to undefined)
let sort: string; //Comma-separated fields, prefixed with `-` for descending order. (optional) (default to undefined)
let language: 'en' | 'de' | 'es' | 'fr' | 'it' | 'ja'; //Preferred language for localized values. (optional) (default to 'en')

const { status, data } = await apiInstance.listCollectionRecords(
    gameId,
    collectionId,
    pageSize,
    cursor,
    fields,
    sort,
    language
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **gameId** | [**&#39;eq&#39; | &#39;eq2&#39; | &#39;mtg&#39; | &#39;dcu&#39; | &#39;ps&#39; | &#39;ps2&#39; | &#39;ps2ps4us&#39; | &#39;ps2ps4eu&#39;**]**Array<&#39;eq&#39; &#124; &#39;eq2&#39; &#124; &#39;mtg&#39; &#124; &#39;dcu&#39; &#124; &#39;ps&#39; &#124; &#39;ps2&#39; &#124; &#39;ps2ps4us&#39; &#124; &#39;ps2ps4eu&#39; &#124; &#39;11184809&#39;>** | Stable Darkclaw game identifier. | defaults to undefined|
| **collectionId** | [**string**] |  | defaults to undefined|
| **pageSize** | [**number**] | Maximum records returned in this page. | (optional) defaults to 20|
| **cursor** | [**string**] | Opaque cursor returned by the previous page. | (optional) defaults to undefined|
| **fields** | [**string**] | Comma-separated response fields to include. | (optional) defaults to undefined|
| **sort** | [**string**] | Comma-separated fields, prefixed with &#x60;-&#x60; for descending order. | (optional) defaults to undefined|
| **language** | [**&#39;en&#39; | &#39;de&#39; | &#39;es&#39; | &#39;fr&#39; | &#39;it&#39; | &#39;ja&#39;**]**Array<&#39;en&#39; &#124; &#39;de&#39; &#124; &#39;es&#39; &#124; &#39;fr&#39; &#124; &#39;it&#39; &#124; &#39;ja&#39; &#124; &#39;11184809&#39;>** | Preferred language for localized values. | (optional) defaults to 'en'|


### Return type

**GenericRecordPage**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | A page of collection records. |  -  |
|**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

