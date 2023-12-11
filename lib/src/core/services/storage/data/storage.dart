import 'dart:convert';

import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/storage_interface.dart';

class Storage implements StorageInterface {
  static Storage? _instance;
  // Avoid self instance
  Storage._();
  static Storage get instance => _instance ??= Storage._();

  late SharedPreferences _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveStringList(List<String> data, String key) async {
    await _prefs.setStringList(key, data);
  }

  @override
  Future<List<String>> readStringList(String key) async {
    return _prefs.getStringList(key) ?? <String>[];
  }

  @override
  Future<void> deleteData(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<List<PokemonInfoEntity>?> fetchDecodedFavoritesPokemon() async {
    List<String> favorites = await readStringList('favoritesPokemonList');
    List<PokemonInfoEntity> decodedPokemonList = [];
    for (var element in favorites) {
      var item = PokemonInfoEntity.fromJson(jsonDecode(element));

      decodedPokemonList.add(item);
    }

    return decodedPokemonList;
  }
}
