import 'package:poke_app/src/core/services/http/domain/http_service.dart';
import '../../../../core/services/http/domain/http_response.dart';

class HomeDataSource {
  final HttpServiceInterface _httpService;

  HomeDataSource(this._httpService);

  Future<HttpResponse> fetchPokemonsList() async {
    final response = await _httpService.get('/pokemon?limit=12&offset=0');
    return response!;
  }

  Future<HttpResponse> fetchPokemonInfo({required String pokemonName}) async {
    final response = await _httpService.get('/pokemon/$pokemonName');
    return response!;
  }

  Future<HttpResponse> fetchPokemonByUrl({required String url}) async {
    final response = await _httpService.get(url);
    return response!;
  }
}
