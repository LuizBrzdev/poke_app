import '../../../../../modules/home/domain/entities/pokemon_list_entity.dart';

abstract class FetchPokemonByUrlUseCase {
  Future<PokemonBasicEntity> execute({required String url});
}
