# api_client.api.SystemApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStatus**](SystemApi.md#getstatus) | **GET** /api/v1/status | Get API status


# **getStatus**
> StatusResponse getStatus()

Get API status

Returns a small unauthenticated response used for scaffold connectivity checks.

### Example
```dart
import 'package:api_client/api.dart';

final api_instance = SystemApi();

try {
    final result = api_instance.getStatus();
    print(result);
} catch (e) {
    print('Exception when calling SystemApi->getStatus: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**StatusResponse**](StatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

