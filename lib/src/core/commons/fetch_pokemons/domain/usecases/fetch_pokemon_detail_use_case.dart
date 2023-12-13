import '../../../../../modules/home/domain/entities/pokemon_info_entity.dart';

abstract class FetchPokemonDetailUseCase {
  Future<PokemonInfoEntity> execute({required String pokemonName});
}
