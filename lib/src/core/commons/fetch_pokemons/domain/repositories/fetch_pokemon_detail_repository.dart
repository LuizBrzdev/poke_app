import '../../../../../modules/home/domain/entities/pokemon_info_entity.dart';

abstract class FetchPokemonDetailRepository {
  Future<PokemonInfoEntity> execute({required String pokemonName});
}
