import 'package:poke_app/src/core/services/http/domain/http_service.dart';

import '../../../../core/services/http/domain/http_response.dart';
import '../../../../settings/app_const.dart';

class HomeDataSource {
  final HttpServiceInterface _httpService;

  HomeDataSource(this._httpService);

  Future<HttpResponse> fetchPokemonsList() async {
    final response = await _httpService.get('${AppConstants.pokeApiUrl}/pokemon?limit=12&offset=0');
    return response!;
  }

  Future<HttpResponse?> fetchPokemonInfo({required String pokemonName}) async {
    final response = await _httpService.get('${AppConstants.pokeApiUrl}/pokemon/$pokemonName');
    return response!;
  }

  Future<HttpResponse?> fetchPokemonByUrl({required String url}) async {
    final response = await _httpService.get(url);
    return response!;
  }
}
