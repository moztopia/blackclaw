//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:darkclaw_census_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:darkclaw_census_api_client/src/model/generic_record_page.dart';
import 'package:darkclaw_census_api_client/src/model/generic_record_response.dart';
import 'package:darkclaw_census_api_client/src/model/problem.dart';

class RecordsApi {

  final Dio _dio;

  const RecordsApi(this._dio);

  /// Get an untyped collection record
  /// 
  ///
  /// Parameters:
  /// * [gameId] - Stable Darkclaw game identifier.
  /// * [collectionId] 
  /// * [recordId] 
  /// * [fields] - Comma-separated response fields to include.
  /// * [language] - Preferred language for localized values.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GenericRecordResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GenericRecordResponse>> getCollectionRecord({ 
    required String gameId,
    required String collectionId,
    required String recordId,
    String? fields,
    String? language = 'en',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/games/{gameId}/collections/{collectionId}/records/{recordId}'.replaceAll('{' r'gameId' '}', gameId.toString()).replaceAll('{' r'collectionId' '}', collectionId.toString()).replaceAll('{' r'recordId' '}', recordId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (fields != null) r'fields': fields,
      if (language != null) r'language': language,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GenericRecordResponse? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GenericRecordResponse, GenericRecordResponse>(rawData, 'GenericRecordResponse', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GenericRecordResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// List records from an untyped collection
  /// Advanced escape hatch for collections that do not yet have a typed Darkclaw resource. Prefer a typed endpoint when one exists. 
  ///
  /// Parameters:
  /// * [gameId] - Stable Darkclaw game identifier.
  /// * [collectionId] 
  /// * [pageSize] - Maximum records returned in this page.
  /// * [cursor] - Opaque cursor returned by the previous page.
  /// * [fields] - Comma-separated response fields to include.
  /// * [sort] - Comma-separated fields, prefixed with `-` for descending order.
  /// * [language] - Preferred language for localized values.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GenericRecordPage] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GenericRecordPage>> listCollectionRecords({ 
    required String gameId,
    required String collectionId,
    int? pageSize = 20,
    String? cursor,
    String? fields,
    String? sort,
    String? language = 'en',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/games/{gameId}/collections/{collectionId}/records'.replaceAll('{' r'gameId' '}', gameId.toString()).replaceAll('{' r'collectionId' '}', collectionId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (pageSize != null) r'pageSize': pageSize,
      if (cursor != null) r'cursor': cursor,
      if (fields != null) r'fields': fields,
      if (sort != null) r'sort': sort,
      if (language != null) r'language': language,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GenericRecordPage? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GenericRecordPage, GenericRecordPage>(rawData, 'GenericRecordPage', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GenericRecordPage>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
