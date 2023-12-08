import 'package:poke_app/src/core/data/services/http/http_response_imp.dart';

import '../../../../core/domain/services/http/http_service.dart';
import '../../../../settings/app_const.dart';

class HomeDataSource {
  final HttpService _httpService;

  HomeDataSource(this._httpService);

  Future<HttpResponseImp> fetchPokemonBasic() async {
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
