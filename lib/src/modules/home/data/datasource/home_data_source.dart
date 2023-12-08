import 'package:poke_app/src/core/services/http/data/http/http_response_imp.dart';
import 'package:poke_app/src/core/services/http/domain/http_service.dart';

import '../../../../settings/app_const.dart';

class HomeDataSource {
  final HttpServiceInterface _httpService;

  HomeDataSource(this._httpService);

  Future<HttpResponseImp> fetchPokemonsList() async {
    final response = await _httpService.get('${AppConstants.pokeApiUrl}/pokemon?limit=12&offset=0');
    return HttpResponseImp(response!);
  }

  Future<HttpResponseImp?> fetchPokemonInfo({required String pokemonName}) async {
    final response = await _httpService.get('${AppConstants.pokeApiUrl}/pokemon/$pokemonName');
    return HttpResponseImp(response!);
  }

  Future<HttpResponseImp?> fetchPokemonByUrl({required String url}) async {
    final response = await _httpService.get(url);
    return HttpResponseImp(response!);
  }
}
