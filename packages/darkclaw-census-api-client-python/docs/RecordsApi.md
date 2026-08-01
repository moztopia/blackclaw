# darkclaw_census_api_client.RecordsApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_collection_record**](RecordsApi.md#get_collection_record) | **GET** /v1/games/{gameId}/collections/{collectionId}/records/{recordId} | Get an untyped collection record
[**list_collection_records**](RecordsApi.md#list_collection_records) | **GET** /v1/games/{gameId}/collections/{collectionId}/records | List records from an untyped collection


# **get_collection_record**
> GenericRecordResponse get_collection_record(game_id, collection_id, record_id, fields=fields, language=language)

Get an untyped collection record

### Example


```python
import darkclaw_census_api_client
from darkclaw_census_api_client.models.generic_record_response import GenericRecordResponse
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
    api_instance = darkclaw_census_api_client.RecordsApi(api_client)
    game_id = 'game_id_example' # str | Stable Darkclaw game identifier.
    collection_id = 'collection_id_example' # str | 
    record_id = 'record_id_example' # str | 
    fields = 'fields_example' # str | Comma-separated response fields to include. (optional)
    language = en # str | Preferred language for localized values. (optional) (default to en)

    try:
        # Get an untyped collection record
        api_response = api_instance.get_collection_record(game_id, collection_id, record_id, fields=fields, language=language)
        print("The response of RecordsApi->get_collection_record:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling RecordsApi->get_collection_record: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **game_id** | **str**| Stable Darkclaw game identifier. | 
 **collection_id** | **str**|  | 
 **record_id** | **str**|  | 
 **fields** | **str**| Comma-separated response fields to include. | [optional] 
 **language** | **str**| Preferred language for localized values. | [optional] [default to en]

### Return type

[**GenericRecordResponse**](GenericRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | The requested collection record. |  -  |
**404** | Resource not found. |  -  |
**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_collection_records**
> GenericRecordPage list_collection_records(game_id, collection_id, page_size=page_size, cursor=cursor, fields=fields, sort=sort, language=language)

List records from an untyped collection

Advanced escape hatch for collections that do not yet have a typed
Darkclaw resource. Prefer a typed endpoint when one exists.


### Example


```python
import darkclaw_census_api_client
from darkclaw_census_api_client.models.generic_record_page import GenericRecordPage
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
    api_instance = darkclaw_census_api_client.RecordsApi(api_client)
    game_id = 'game_id_example' # str | Stable Darkclaw game identifier.
    collection_id = 'collection_id_example' # str | 
    page_size = 20 # int | Maximum records returned in this page. (optional) (default to 20)
    cursor = 'cursor_example' # str | Opaque cursor returned by the previous page. (optional)
    fields = 'fields_example' # str | Comma-separated response fields to include. (optional)
    sort = 'sort_example' # str | Comma-separated fields, prefixed with `-` for descending order. (optional)
    language = en # str | Preferred language for localized values. (optional) (default to en)

    try:
        # List records from an untyped collection
        api_response = api_instance.list_collection_records(game_id, collection_id, page_size=page_size, cursor=cursor, fields=fields, sort=sort, language=language)
        print("The response of RecordsApi->list_collection_records:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling RecordsApi->list_collection_records: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **game_id** | **str**| Stable Darkclaw game identifier. | 
 **collection_id** | **str**|  | 
 **page_size** | **int**| Maximum records returned in this page. | [optional] [default to 20]
 **cursor** | **str**| Opaque cursor returned by the previous page. | [optional] 
 **fields** | **str**| Comma-separated response fields to include. | [optional] 
 **sort** | **str**| Comma-separated fields, prefixed with &#x60;-&#x60; for descending order. | [optional] 
 **language** | **str**| Preferred language for localized values. | [optional] [default to en]

### Return type

[**GenericRecordPage**](GenericRecordPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | A page of collection records. |  -  |
**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

