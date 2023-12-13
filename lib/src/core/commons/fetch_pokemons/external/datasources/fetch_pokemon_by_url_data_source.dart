import '../../../../services/http/domain/http_response.dart';

abstract class FetchPokemonByUrlDataSource {
  Future<HttpResponse> execute({required String url});
}
