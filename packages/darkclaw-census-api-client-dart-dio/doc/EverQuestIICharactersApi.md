# darkclaw_census_api_client.api.EverQuestIICharactersApi

## Load the API package
```dart
import 'package:darkclaw_census_api_client/api.dart';
```

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCharacter**](EverQuestIICharactersApi.md#getcharacter) | **GET** /v1/games/eq2/characters/{characterId} | Get an EverQuest II character
[**listCharacters**](EverQuestIICharactersApi.md#listcharacters) | **GET** /v1/games/eq2/characters | Search EverQuest II characters


# **getCharacter**
> CharacterResponse getCharacter(characterId, fields, language)

Get an EverQuest II character

### Example
```dart
import 'package:darkclaw_census_api_client/api.dart';

final api = DarkclawCensusApiClient().getEverQuestIICharactersApi();
final String characterId = characterId_example; // String | 
final String fields = fields_example; // String | Comma-separated response fields to include.
final String language = language_example; // String | Preferred language for localized values.

try {
    final response = api.getCharacter(characterId, fields, language);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EverQuestIICharactersApi->getCharacter: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **String**|  | 
 **fields** | **String**| Comma-separated response fields to include. | [optional] 
 **language** | **String**| Preferred language for localized values. | [optional] [default to 'en']

### Return type

[**CharacterResponse**](CharacterResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCharacters**
> CharacterPage listCharacters(pageSize, cursor, fields, name, server, className, minimumLevel, maximumLevel, sort, language)

Search EverQuest II characters

### Example
```dart
import 'package:darkclaw_census_api_client/api.dart';

final api = DarkclawCensusApiClient().getEverQuestIICharactersApi();
final int pageSize = 56; // int | Maximum records returned in this page.
final String cursor = cursor_example; // String | Opaque cursor returned by the previous page.
final String fields = fields_example; // String | Comma-separated response fields to include.
final String name = name_example; // String | Exact character first name.
final String server = server_example; // String | Exact server name.
final String className = className_example; // String | Exact adventure class name.
final int minimumLevel = 56; // int | 
final int maximumLevel = 56; // int | 
final String sort = sort_example; // String | Character field, prefixed with `-` for descending order.
final String language = language_example; // String | Preferred language for localized values.

try {
    final response = api.listCharacters(pageSize, cursor, fields, name, server, className, minimumLevel, maximumLevel, sort, language);
    print(response);
} on DioException catch (e) {
    print('Exception when calling EverQuestIICharactersApi->listCharacters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageSize** | **int**| Maximum records returned in this page. | [optional] [default to 20]
 **cursor** | **String**| Opaque cursor returned by the previous page. | [optional] 
 **fields** | **String**| Comma-separated response fields to include. | [optional] 
 **name** | **String**| Exact character first name. | [optional] 
 **server** | **String**| Exact server name. | [optional] 
 **className** | **String**| Exact adventure class name. | [optional] 
 **minimumLevel** | **int**|  | [optional] 
 **maximumLevel** | **int**|  | [optional] 
 **sort** | **String**| Character field, prefixed with `-` for descending order. | [optional] [default to 'name']
 **language** | **String**| Preferred language for localized values. | [optional] [default to 'en']

### Return type

[**CharacterPage**](CharacterPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

