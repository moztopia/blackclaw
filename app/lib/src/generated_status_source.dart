import 'package:dio/dio.dart';

import 'status/status_source.dart';

/// Legacy scaffold adapter for the Darkclaw website API health endpoint.
///
/// This deliberately does not use a Census client. A generated website API client will
/// replace it after `darkclaw-website.openapi.yaml` is introduced.
class GeneratedStatusSource implements StatusSource {
  GeneratedStatusSource({required String baseUrl}) : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  final Dio _dio;

  @override
  Future<ApiStatus> fetchStatus() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/status');
    final data = response.data;
    if (data == null) {
      throw StateError('The website API returned an empty status response.');
    }
    return ApiStatus(status: '${data['status']}', service: '${data['service']}');
  }
}
