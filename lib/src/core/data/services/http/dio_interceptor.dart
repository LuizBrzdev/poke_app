import 'dart:async';
import 'package:dio/dio.dart';
import '../../../domain/services/http/http_status_code.dart';
import 'package:flutter/foundation.dart';

class AppInterceptors extends Interceptor {
  // final AuthController _auth;

  AppInterceptors({
    required this.dio,
    this.retries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 3),
      Duration(seconds: 5),
    ],
    this.retryMethods = const ['GET'],
    this.reqNoRetry = '',
  }) : super();

  final Dio dio;
  final int retries;
  final List<Duration> retryDelays;
  final List<String> retryMethods;
  final String reqNoRetry;

  static FutureOr<bool> defaultRetryEvaluator(DioError error, int attempt) {
    bool shouldRetry;
    if (error.type == DioErrorType.badResponse) {
      final statusCode = error.response?.statusCode;
      if (statusCode != null) {
        shouldRetry = isRetryable(statusCode);
      } else {
        shouldRetry = true;
      }
    } else {
      shouldRetry = error.type != DioErrorType.cancel && error.error is! FormatException;
    }
    return shouldRetry;
  }

  Future<bool> _shouldRetry(DioError error, int attempt) async {
    try {
      debugPrint(
          '::::::: ERROR: [$error] - RETRY: [$attempt] - ENDPOINT: [${error.requestOptions.baseUrl}${error.requestOptions.path}]');
      return await defaultRetryEvaluator(error, attempt);
    } catch (e) {
      debugPrint('There was an exception in _retryEvaluator: $e');
      if (!false) rethrow;
    }
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 500) {
      // Get.offAll(
      //   () => CScreenInformation(
      //     subject: 'Ocorreu um erro inesperado',
      //     description: 'Por favor, tente novamente mais tarde.',
      //     onTap: () {},
      //   ),
      // );
    }

    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!retryMethods.contains(err.requestOptions.method) ||
        reqNoRetry == err.requestOptions.path) {
      // Get.offAll(
      //   () => CScreenInformation(
      //     subject: 'Ocorreu um erro inesperado',
      //     description: 'Por favor, tente novamente mais tarde.',
      //     onTap: () {},
      //   ),
      // );
      return super.onError(err, handler);
    }

    final attempt = err.requestOptions._attempt + 1;
    final shouldRetry = attempt <= retries && await _shouldRetry(err, attempt);

    if (!shouldRetry) {
      // Get.offAll(
      //   () => CScreenInformation(
      //     subject: 'Ocorreu um erro inesperado',
      //     description: 'Por favor, tente novamente mais tarde.',
      //     onTap: () {},
      //   ),
      // );
      return super.onError(err, handler);
    }

    err.requestOptions._attempt = attempt;
    final delay = _getDelay(attempt);

    if (delay != Duration.zero) await Future<void>.delayed(delay);

    try {
      await dio.fetch<void>(err.requestOptions).then((value) => handler.resolve(value));
    } on DioError catch (e) {
      // Get.offAll(
      //   () => CScreenInformation(
      //       subject: 'Ocorreu um erro inesperado',
      //       description: 'Por favor, tente novamente mais tarde.',
      //       onTap: () {}),
      // );
      return super.onError(e, handler);
    }
  }

  Duration _getDelay(int attempt) {
    if (retryDelays.isEmpty) return Duration.zero;
    return attempt - 1 < retryDelays.length ? retryDelays[attempt - 1] : retryDelays.last;
  }
}

extension RequestOptionsX on RequestOptions {
  static const _kAttemptKey = 'ro_attempt';
  static const _kDisableRetryKey = 'ro_disable_retry';

  int get _attempt => (extra[_kAttemptKey] as int?) ?? 0;

  set _attempt(int value) => extra[_kAttemptKey] = value;

  bool get disableRetry => (extra[_kDisableRetryKey] as bool?) ?? false;

  set disableRetry(bool value) => extra[_kDisableRetryKey] = value;
}
