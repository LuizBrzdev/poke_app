import 'package:dio/dio.dart';

import '../../../domain/services/http/http_response.dart';

class HttpResponseImp<T> implements HttpResponseAbstract {
  final Response<T> _response;

  HttpResponseImp(this._response);

  @override
  int? get statusCode => _response.statusCode;

  @override
  T? get data => _response.data;

  @override
  Map<String, dynamic> get headers => _response.headers.map;
}
