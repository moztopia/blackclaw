# DiscoveryApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|[**listCollections**](#listcollections) | **GET** /v1/games/{gameId}/collections | List available collections|

# **listCollections**
> CollectionListResponse listCollections()

Lists the upstream data collections available for a supported game.

### Example

```typescript
import {
    DiscoveryApi,
    Configuration
} from '@darkclaw/census-api-client';

const configuration = new Configuration();
const apiInstance = new DiscoveryApi(configuration);

let gameId: 'eq' | 'eq2' | 'mtg' | 'dcu' | 'ps' | 'ps2' | 'ps2ps4us' | 'ps2ps4eu'; //Stable Darkclaw game identifier. (default to undefined)

const { status, data } = await apiInstance.listCollections(
    gameId
);
```

### Parameters

|Name | Type | Description  | Notes|
|------------- | ------------- | ------------- | -------------|
| **gameId** | [**&#39;eq&#39; | &#39;eq2&#39; | &#39;mtg&#39; | &#39;dcu&#39; | &#39;ps&#39; | &#39;ps2&#39; | &#39;ps2ps4us&#39; | &#39;ps2ps4eu&#39;**]**Array<&#39;eq&#39; &#124; &#39;eq2&#39; &#124; &#39;mtg&#39; &#124; &#39;dcu&#39; &#124; &#39;ps&#39; &#124; &#39;ps2&#39; &#124; &#39;ps2ps4us&#39; &#124; &#39;ps2ps4eu&#39; &#124; &#39;11184809&#39;>** | Stable Darkclaw game identifier. | defaults to undefined|


### Return type

**CollectionListResponse**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
|**200** | Collection inventory. |  -  |
|**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

