import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

abstract class Storage {
  Future<void> init();

  Future<void> saveStringList(List<String> data, String key);

  Future<List<String>?> readStringList(String key);

  Future<void> deleteData(String key);

  Future<List<PokemonInfoEntity>?> fetchDecodedFavoritesPokemon();
}
