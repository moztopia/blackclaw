//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:darkclaw_census_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:darkclaw_census_api_client/src/model/character_page.dart';
import 'package:darkclaw_census_api_client/src/model/character_response.dart';
import 'package:darkclaw_census_api_client/src/model/problem.dart';

class EverQuestIICharactersApi {

  final Dio _dio;

  const EverQuestIICharactersApi(this._dio);

  /// Get an EverQuest II character
  /// 
  ///
  /// Parameters:
  /// * [characterId] 
  /// * [fields] - Comma-separated response fields to include.
  /// * [language] - Preferred language for localized values.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CharacterResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<CharacterResponse>> getCharacter({ 
    required String characterId,
    String? fields,
    String? language = 'en',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/games/eq2/characters/{characterId}'.replaceAll('{' r'characterId' '}', characterId.toString());
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

    CharacterResponse? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<CharacterResponse, CharacterResponse>(rawData, 'CharacterResponse', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<CharacterResponse>(
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

  /// Search EverQuest II characters
  /// 
  ///
  /// Parameters:
  /// * [pageSize] - Maximum records returned in this page.
  /// * [cursor] - Opaque cursor returned by the previous page.
  /// * [fields] - Comma-separated response fields to include.
  /// * [name] - Exact character first name.
  /// * [server] - Exact server name.
  /// * [className] - Exact adventure class name.
  /// * [minimumLevel] 
  /// * [maximumLevel] 
  /// * [sort] - Character field, prefixed with `-` for descending order.
  /// * [language] - Preferred language for localized values.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CharacterPage] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<CharacterPage>> listCharacters({ 
    int? pageSize = 20,
    String? cursor,
    String? fields,
    String? name,
    String? server,
    String? className,
    int? minimumLevel,
    int? maximumLevel,
    String? sort = 'name',
    String? language = 'en',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/games/eq2/characters';
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
      if (name != null) r'name': name,
      if (server != null) r'server': server,
      if (className != null) r'className': className,
      if (minimumLevel != null) r'minimumLevel': minimumLevel,
      if (maximumLevel != null) r'maximumLevel': maximumLevel,
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

    CharacterPage? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<CharacterPage, CharacterPage>(rawData, 'CharacterPage', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<CharacterPage>(
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
