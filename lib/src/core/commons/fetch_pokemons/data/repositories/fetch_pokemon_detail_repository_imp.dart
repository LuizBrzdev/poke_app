import 'package:poke_app/src/core/commons/fetch_pokemons/external/datasources/fetch_pokemon_detail_data_source.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

import '../../domain/repositories/fetch_pokemon_detail_repository.dart';

class FetchPokemonDetailRepositoryImp implements FetchPokemonDetailRepository {
  final FetchPokemonDetailDataSource _fetchPokemonDetailDataSource;

  FetchPokemonDetailRepositoryImp(this._fetchPokemonDetailDataSource);

  @override
  Future<PokemonInfoEntity> execute({required String pokemonName}) async {
    final response = await _fetchPokemonDetailDataSource.execute(pokemonName: pokemonName);
    if (response.statusCode == 200) {
      return PokemonInfoEntity.fromJson(response.data);
    } else {
      return PokemonInfoEntity();
    }
  }
}
