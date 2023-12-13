import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';
import 'package:poke_app/src/modules/home/domain/repository/home_repository.dart';

import '../../infra/datasource/home_data_source.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImp(this._homeDataSource);

  @override
  Future<PokemonBasicEntity?> fetchPokemonsList() async {
    final response = await _homeDataSource.fetchPokemonsList();

    if (response.statusCode == 200) {
      return PokemonBasicEntity.fromJson(response.data);
    }
    return PokemonBasicEntity(count: 0, next: '', previous: '', results: []);
  }

  @override
  Future<PokemonInfoEntity?> fetchPokemonInfo({required String pokemonName}) async {
    final response = await _homeDataSource.fetchPokemonInfo(pokemonName: pokemonName);
    if (response.statusCode == 200) {
      return PokemonInfoEntity.fromJson(response.data);
    }
    return PokemonInfoEntity();
  }

  @override
  Future<PokemonBasicEntity?> fetchPokemonByUrl({required String url}) async {
    final response = await _homeDataSource.fetchPokemonByUrl(url: url);
    if (response.statusCode == 200) {
      return PokemonBasicEntity.fromJson(response.data);
    }
    return PokemonBasicEntity(count: 0, next: '', previous: '', results: []);
  }
}
