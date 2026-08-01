# SystemApi

All URIs are relative to *http://localhost:8000*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getStatus**](SystemApi.md#getstatus) | **GET** /api/v1/status | Get API status |



## getStatus

> StatusResponse getStatus()

Get API status

Returns a small unauthenticated response used for scaffold connectivity checks.

### Example

```ts
import {
  Configuration,
  SystemApi,
} from '@monorepo/api-client';
import type { GetStatusRequest } from '@monorepo/api-client';

async function example() {
  console.log("🚀 Testing @monorepo/api-client SDK...");
  const api = new SystemApi();

  try {
    const data = await api.getStatus();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**StatusResponse**](StatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The API is available. |  -  |
| **500** | The API could not produce a status response. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

