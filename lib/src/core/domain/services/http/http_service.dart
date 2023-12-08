import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>?> get<T>(
    String url, {
    bool checkStatusCode = true,
    bool retry = true,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response<T>?> post<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
    bool retry = true,
  });

  Future<Response<T>?> put<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });

  Future<Response<T>?> patch<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });

  Future<Response<T>?> delete<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });
}
