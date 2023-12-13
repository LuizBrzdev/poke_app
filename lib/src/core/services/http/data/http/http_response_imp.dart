import 'package:dio/dio.dart';

import '../../domain/http_response.dart';

class HttpResponseImp<T> implements HttpResponse {
  final Response<T> _response;

  HttpResponseImp(this._response);

  @override
  int? get statusCode => _response.statusCode;

  @override
  T? get data => _response.data;

  @override
  Map<String, dynamic> get headers => _response.headers.map;
}
