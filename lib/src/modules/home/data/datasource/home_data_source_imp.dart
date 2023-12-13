import 'package:poke_app/src/core/services/http/domain/http_service.dart';
import '../../../../core/services/http/domain/http_response.dart';
import '../../external/datasource/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  final HttpServiceInterface _httpService;

  HomeDataSourceImp(this._httpService);

  @override
  Future<HttpResponse> fetchPokemonsList() async {
    final response = await _httpService.get('/pokemon?limit=12&offset=0');
    return response!;
  }

  @override
  Future<HttpResponse> fetchPokemonInfo({required String pokemonName}) async {
    final response = await _httpService.get('/pokemon/$pokemonName');
    return response!;
  }

  @override
  Future<HttpResponse> fetchPokemonByUrl({required String url}) async {
    final response = await _httpService.get(url);
    return response!;
  }
}
