# darkclaw_census_api_client.DiscoveryApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_collections**](DiscoveryApi.md#list_collections) | **GET** /v1/games/{gameId}/collections | List available collections


# **list_collections**
> CollectionListResponse list_collections(game_id)

List available collections

Lists the upstream data collections available for a supported game.

### Example


```python
import darkclaw_census_api_client
from darkclaw_census_api_client.models.collection_list_response import CollectionListResponse
from darkclaw_census_api_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to https://api.darkclaw.mozrin.com
# See configuration.py for a list of all supported configuration parameters.
configuration = darkclaw_census_api_client.Configuration(
    host = "https://api.darkclaw.mozrin.com"
)


# Enter a context with an instance of the API client
with darkclaw_census_api_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = darkclaw_census_api_client.DiscoveryApi(api_client)
    game_id = 'game_id_example' # str | Stable Darkclaw game identifier.

    try:
        # List available collections
        api_response = api_instance.list_collections(game_id)
        print("The response of DiscoveryApi->list_collections:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DiscoveryApi->list_collections: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **game_id** | **str**| Stable Darkclaw game identifier. | 

### Return type

[**CollectionListResponse**](CollectionListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Collection inventory. |  -  |
**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

