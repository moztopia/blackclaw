import 'package:api_client/api.dart';

import 'status/status_source.dart';

/// Keeps generated OpenAPI types at the edge of the application.
class GeneratedStatusSource implements StatusSource {
  GeneratedStatusSource({required String baseUrl})
    : _api = SystemApi(ApiClient(basePath: baseUrl));

  final SystemApi _api;

  @override
  Future<ApiStatus> fetchStatus() async {
    final response = await _api.getStatus();
    if (response == null) {
      throw StateError('The API returned an empty status response.');
    }

    return ApiStatus(
      status: response.status.toString(),
      service: response.service.toString(),
    );
  }
}
