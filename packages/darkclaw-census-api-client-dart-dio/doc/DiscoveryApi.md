# darkclaw_census_api_client.api.DiscoveryApi

## Load the API package
```dart
import 'package:darkclaw_census_api_client/api.dart';
```

All URIs are relative to *https://api.darkclaw.mozrin.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listCollections**](DiscoveryApi.md#listcollections) | **GET** /v1/games/{gameId}/collections | List available collections


# **listCollections**
> CollectionListResponse listCollections(gameId)

List available collections

Lists the upstream data collections available for a supported game.

### Example
```dart
import 'package:darkclaw_census_api_client/api.dart';

final api = DarkclawCensusApiClient().getDiscoveryApi();
final String gameId = gameId_example; // String | Stable Darkclaw game identifier.

try {
    final response = api.listCollections(gameId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DiscoveryApi->listCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| Stable Darkclaw game identifier. | 

### Return type

[**CollectionListResponse**](CollectionListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

