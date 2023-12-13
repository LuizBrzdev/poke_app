import '../../../../../modules/home/domain/entities/pokemon_list_entity.dart';

abstract class FetchPokemonBasicInfoUseCase {
  Future<PokemonBasicEntity> execute();
}
