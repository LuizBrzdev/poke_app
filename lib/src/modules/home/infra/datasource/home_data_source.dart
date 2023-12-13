import '../../../../core/services/http/domain/http_response.dart';

abstract class HomeDataSource {
  Future<HttpResponse> fetchPokemonsList();

  Future<HttpResponse> fetchPokemonInfo({required String pokemonName});

  Future<HttpResponse> fetchPokemonByUrl({required String url});
}
