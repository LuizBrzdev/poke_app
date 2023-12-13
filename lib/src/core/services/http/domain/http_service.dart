import './http_response.dart';

abstract class HttpServiceInterface {
  Future<HttpResponse<T>?> get<T>(
    String url, {
    bool checkStatusCode = true,
    bool retry = true,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse<T>?> post<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
    bool retry = true,
  });

  Future<HttpResponse<T>?> put<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });

  Future<HttpResponse<T>?> patch<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });

  Future<HttpResponse<T>?> delete<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool retry = true,
  });
}
