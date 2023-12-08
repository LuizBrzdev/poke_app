abstract class HttpResponseAbstract<T> {
  int? get statusCode;
  T? get data;
  Map<String, dynamic> get headers;
}
