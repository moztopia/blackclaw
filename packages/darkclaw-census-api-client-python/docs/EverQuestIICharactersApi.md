# darkclaw_census_api_client.EverQuestIICharactersApi

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_character**](EverQuestIICharactersApi.md#get_character) | **GET** /v1/games/eq2/characters/{characterId} | Get an EverQuest II character
[**list_characters**](EverQuestIICharactersApi.md#list_characters) | **GET** /v1/games/eq2/characters | Search EverQuest II characters


# **get_character**
> CharacterResponse get_character(character_id, fields=fields, language=language)

Get an EverQuest II character

### Example


```python
import darkclaw_census_api_client
from darkclaw_census_api_client.models.character_response import CharacterResponse
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
    api_instance = darkclaw_census_api_client.EverQuestIICharactersApi(api_client)
    character_id = 'character_id_example' # str | 
    fields = 'fields_example' # str | Comma-separated response fields to include. (optional)
    language = en # str | Preferred language for localized values. (optional) (default to en)

    try:
        # Get an EverQuest II character
        api_response = api_instance.get_character(character_id, fields=fields, language=language)
        print("The response of EverQuestIICharactersApi->get_character:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EverQuestIICharactersApi->get_character: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **character_id** | **str**|  | 
 **fields** | **str**| Comma-separated response fields to include. | [optional] 
 **language** | **str**| Preferred language for localized values. | [optional] [default to en]

### Return type

[**CharacterResponse**](CharacterResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | The requested character. |  -  |
**404** | Resource not found. |  -  |
**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_characters**
> CharacterPage list_characters(page_size=page_size, cursor=cursor, fields=fields, name=name, server=server, class_name=class_name, minimum_level=minimum_level, maximum_level=maximum_level, sort=sort, language=language)

Search EverQuest II characters

### Example


```python
import darkclaw_census_api_client
from darkclaw_census_api_client.models.character_page import CharacterPage
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
    api_instance = darkclaw_census_api_client.EverQuestIICharactersApi(api_client)
    page_size = 20 # int | Maximum records returned in this page. (optional) (default to 20)
    cursor = 'cursor_example' # str | Opaque cursor returned by the previous page. (optional)
    fields = 'fields_example' # str | Comma-separated response fields to include. (optional)
    name = 'name_example' # str | Exact character first name. (optional)
    server = 'server_example' # str | Exact server name. (optional)
    class_name = 'class_name_example' # str | Exact adventure class name. (optional)
    minimum_level = 56 # int |  (optional)
    maximum_level = 56 # int |  (optional)
    sort = name # str | Character field, prefixed with `-` for descending order. (optional) (default to name)
    language = en # str | Preferred language for localized values. (optional) (default to en)

    try:
        # Search EverQuest II characters
        api_response = api_instance.list_characters(page_size=page_size, cursor=cursor, fields=fields, name=name, server=server, class_name=class_name, minimum_level=minimum_level, maximum_level=maximum_level, sort=sort, language=language)
        print("The response of EverQuestIICharactersApi->list_characters:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EverQuestIICharactersApi->list_characters: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page_size** | **int**| Maximum records returned in this page. | [optional] [default to 20]
 **cursor** | **str**| Opaque cursor returned by the previous page. | [optional] 
 **fields** | **str**| Comma-separated response fields to include. | [optional] 
 **name** | **str**| Exact character first name. | [optional] 
 **server** | **str**| Exact server name. | [optional] 
 **class_name** | **str**| Exact adventure class name. | [optional] 
 **minimum_level** | **int**|  | [optional] 
 **maximum_level** | **int**|  | [optional] 
 **sort** | **str**| Character field, prefixed with &#x60;-&#x60; for descending order. | [optional] [default to name]
 **language** | **str**| Preferred language for localized values. | [optional] [default to en]

### Return type

[**CharacterPage**](CharacterPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | A page of typed characters. |  -  |
**0** | Request or service failure. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

