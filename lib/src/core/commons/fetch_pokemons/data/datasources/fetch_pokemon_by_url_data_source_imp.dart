import 'package:poke_app/src/core/services/http/domain/http_response.dart';
import 'package:poke_app/src/core/services/http/domain/http_service.dart';

import '../../external/datasources/fetch_pokemon_by_url_data_source.dart';

class FetchPokemonByUrlDataSourceImp implements FetchPokemonByUrlDataSource {
  final HttpService _httpService;

  FetchPokemonByUrlDataSourceImp(this._httpService);

  @override
  Future<HttpResponse> execute({required String url}) async {
    final response = await _httpService.get(url);
    return response!;
  }
}
