import 'package:poke_app/src/core/services/http/domain/http_response.dart';
import 'package:poke_app/src/core/services/http/domain/http_service.dart';

import '../../external/datasources/fetch_pokemon_detail_data_source.dart';

class FetchPokemonDetailDataSourceImp implements FetchPokemonDetailDataSource {
  final HttpService _httpService;

  FetchPokemonDetailDataSourceImp(this._httpService);

  @override
  Future<HttpResponse> execute({required String pokemonName}) async {
    final response = await _httpService.get('/pokemon/$pokemonName');
    return response!;
  }
}
