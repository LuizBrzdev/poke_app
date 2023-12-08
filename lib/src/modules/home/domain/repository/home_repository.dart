import '../entities/pokemon_info_entity.dart';
import '../entities/pokemon_list_entity.dart';

abstract class HomeRepository {
  Future<PokemonBasicEntity?> fetchPokemonsList();

  Future<PokemonInfoEntity?> fetchPokemonInfo({required String pokemonName});

  Future<PokemonBasicEntity?> fetchPokemonByUrl({required String url});
}
