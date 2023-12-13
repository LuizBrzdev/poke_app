import '../../../../services/http/domain/http_response.dart';

abstract class FetchPokemonDetailDataSource {
  Future<HttpResponse> execute({required String pokemonName});
}
