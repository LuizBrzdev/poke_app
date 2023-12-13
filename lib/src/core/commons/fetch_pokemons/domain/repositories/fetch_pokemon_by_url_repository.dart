import '../../../../../modules/home/domain/entities/pokemon_list_entity.dart';

abstract class FetchPokemonByUrlRepository {
  Future<PokemonBasicEntity> execute({required String url});
}
