import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

abstract class AppInterceptorSettings {
  static AppInterceptors appInterceptors({
    Dio? dio,
    int retries = 5,
    List<String>? retryMethods,
    String reqNoRetry = '',
  }) =>
      AppInterceptors(
        dio: dio!,
        retries: retries,
        retryMethods: retryMethods ?? ['GET', 'POST'],
        reqNoRetry: reqNoRetry,
      );
}
