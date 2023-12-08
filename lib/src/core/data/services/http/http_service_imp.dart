import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poke_app/src/core/domain/services/http/http_service.dart';

import 'http_interceptor_settings.dart';

class HttpServiceImp implements HttpService {
  late Dio? _dio;

  HttpServiceImp() {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      receiveTimeout: const Duration(seconds: 5),
      validateStatus: (statusCode) => true,
      contentType: Headers.jsonContentType,
    );

    _dio = Dio(options);
    _dio!.interceptors.add(AppInterceptorSettings.appInterceptors(dio: _dio!));
  }

  @override
  Future<Response<T>?> get<T>(String url,
          {bool checkStatusCode = true,
          bool retry = true,
          Map<String, dynamic>? queryParameters}) =>
      dioGet(
        url,
        checkStatusCode: true,
        retry: true,
      );

  @override
  Future<Response<T>?> post<T>(String url, data,
          {Map<String, dynamic>? queryParameters,
          bool checkStatusCode = true,
          bool retry = true}) =>
      dioPost(
        url,
        data,
        checkStatusCode: true,
        queryParameters: queryParameters,
        retry: true,
      );

  @override
  Future<Response<T>?> patch<T>(String url, data,
          {Map<String, dynamic>? queryParameters, bool retry = true}) =>
      dioPatch(
        url,
        data,
        queryParameters: queryParameters,
        retry: true,
      );

  @override
  Future<Response<T>?> put<T>(String url, data,
          {Map<String, dynamic>? queryParameters, bool retry = true}) =>
      dioPut(
        url,
        data,
        queryParameters: queryParameters,
        retry: true,
      );

  @override
  Future<Response<T>?> delete<T>(String url, data,
          {Map<String, dynamic>? queryParameters, bool retry = true}) =>
      dioDelete(
        url,
        data,
        queryParameters: queryParameters,
        retry: true,
      );

  ///Implementations

  Future<Response<T>?> dioPut<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  }) async {
    try {
      if (!retry) {
        _dio!.interceptors[0] = AppInterceptorSettings.appInterceptors(dio: _dio, reqNoRetry: url);
      }

      Response<T> response = await _dio!.put(url, data: data, queryParameters: queryParameters);

      debugPrint(
        "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: PUT] :: [Header: ${response.requestOptions.headers}] :: [Payload: $data] :: [Body Response: ${response.data}]",
      );

      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Future<Response<T>?> dioPatch<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  }) async {
    try {
      if (!retry) {
        _dio!.interceptors[0] = AppInterceptorSettings.appInterceptors(dio: _dio, reqNoRetry: url);
      }

      Response<T> response = await _dio!.patch(url, data: data, queryParameters: queryParameters);

      debugPrint(
        "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: PATCH] :: [Header: ${response.requestOptions.headers}] :: [Payload: $data] :: [Body Response: ${response.data}]",
      );

      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response<T>?> dioDelete<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  }) async {
    try {
      if (!retry) {
        _dio!.interceptors[0] = AppInterceptorSettings.appInterceptors(dio: _dio, reqNoRetry: url);
      }
      Response<T> response = await _dio!.delete(url, data: data, queryParameters: queryParameters);
      debugPrint(
        "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: DELETE] :: [Header: ${response.requestOptions.headers}] :: [Payload: $data] :: [Body Response: ${response.data}]",
      );

      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response<T>?> dioGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
    bool retry = true,
  }) async {
    try {
      if (!retry) {
        _dio!.interceptors[0] = AppInterceptorSettings.appInterceptors(dio: _dio, reqNoRetry: url);
      }

      Response<T> response = await _dio!.get(url, queryParameters: queryParameters);

      debugPrint(
        "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: POST] :: [Header: ${response.requestOptions.headers}] :: [Body Response: ${response.data}]",
      );

      if (checkStatusCode) {
        return response;
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  Future<Response<T>?> dioPost<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
    bool retry = true,
  }) async {
    try {
      if (!retry) {
        _dio!.interceptors[0] = AppInterceptorSettings.appInterceptors(dio: _dio, reqNoRetry: url);
      }

      Response<T> response = await _dio!.post(url, data: data, queryParameters: queryParameters);

      debugPrint(
        "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: POST] :: [Header: ${response.requestOptions.headers}] :: [Payload: $data] :: [Body Response: ${response.data}]",
      );

      if (checkStatusCode) {
        return response;
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}
