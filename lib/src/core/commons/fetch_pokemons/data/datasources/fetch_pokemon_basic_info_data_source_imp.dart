import 'package:poke_app/src/core/services/http/domain/http_response.dart';

import '../../../../services/http/domain/http_service.dart';
import '../../external/datasources/fetch_pokemon_basic_info_data_source.dart';

class FetchPokemonBasicInfoDataSourceImp implements FetchPokemonBasicInfoDataSource {
  final HttpService _httpService;

  FetchPokemonBasicInfoDataSourceImp(this._httpService);

  @override
  Future<HttpResponse> execute() async {
    final response = await _httpService.get('/pokemon?limit=12&offset=0');
    return response!;
  }
}
