# darkclaw_census_api_client.api.RecordsApi

## Load the API package
```dart
import 'package:darkclaw_census_api_client/api.dart';
```

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCollectionRecord**](RecordsApi.md#getcollectionrecord) | **GET** /v1/games/{gameId}/collections/{collectionId}/records/{recordId} | Get an untyped collection record
[**listCollectionRecords**](RecordsApi.md#listcollectionrecords) | **GET** /v1/games/{gameId}/collections/{collectionId}/records | List records from an untyped collection


# **getCollectionRecord**
> GenericRecordResponse getCollectionRecord(gameId, collectionId, recordId, fields, language)

Get an untyped collection record

### Example
```dart
import 'package:darkclaw_census_api_client/api.dart';

final api = DarkclawCensusApiClient().getRecordsApi();
final String gameId = gameId_example; // String | Stable Darkclaw game identifier.
final String collectionId = collectionId_example; // String | 
final String recordId = recordId_example; // String | 
final String fields = fields_example; // String | Comma-separated response fields to include.
final String language = language_example; // String | Preferred language for localized values.

try {
    final response = api.getCollectionRecord(gameId, collectionId, recordId, fields, language);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RecordsApi->getCollectionRecord: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| Stable Darkclaw game identifier. | 
 **collectionId** | **String**|  | 
 **recordId** | **String**|  | 
 **fields** | **String**| Comma-separated response fields to include. | [optional] 
 **language** | **String**| Preferred language for localized values. | [optional] [default to 'en']

### Return type

[**GenericRecordResponse**](GenericRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCollectionRecords**
> GenericRecordPage listCollectionRecords(gameId, collectionId, pageSize, cursor, fields, sort, language)

List records from an untyped collection

Advanced escape hatch for collections that do not yet have a typed Darkclaw resource. Prefer a typed endpoint when one exists. 

### Example
```dart
import 'package:darkclaw_census_api_client/api.dart';

final api = DarkclawCensusApiClient().getRecordsApi();
final String gameId = gameId_example; // String | Stable Darkclaw game identifier.
final String collectionId = collectionId_example; // String | 
final int pageSize = 56; // int | Maximum records returned in this page.
final String cursor = cursor_example; // String | Opaque cursor returned by the previous page.
final String fields = fields_example; // String | Comma-separated response fields to include.
final String sort = sort_example; // String | Comma-separated fields, prefixed with `-` for descending order.
final String language = language_example; // String | Preferred language for localized values.

try {
    final response = api.listCollectionRecords(gameId, collectionId, pageSize, cursor, fields, sort, language);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RecordsApi->listCollectionRecords: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| Stable Darkclaw game identifier. | 
 **collectionId** | **String**|  | 
 **pageSize** | **int**| Maximum records returned in this page. | [optional] [default to 20]
 **cursor** | **String**| Opaque cursor returned by the previous page. | [optional] 
 **fields** | **String**| Comma-separated response fields to include. | [optional] 
 **sort** | **String**| Comma-separated fields, prefixed with `-` for descending order. | [optional] 
 **language** | **String**| Preferred language for localized values. | [optional] [default to 'en']

### Return type

[**GenericRecordPage**](GenericRecordPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

