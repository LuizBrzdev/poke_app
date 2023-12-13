import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/src/core/services/storage/domain/storage.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

part '../states/pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final Storage _storage;

  PokemonDetailCubit(this._storage) : super(PokemonDetailInitial());

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  Future<void> saveFavoritePokemon(PokemonInfoEntity pokemon) async {
    List<String> favorites = await fetchFavoritesPokemonOnStorage() ?? <String>[];

    if (!isFavorite) {
      favorites.add(jsonEncode(pokemon));
      await _storage.saveStringList(favorites, 'favoritesPokemonList');
      await _storage.fetchDecodedFavoritesPokemon();
      _isFavorite = true;
      emit(PokemonDetailSucess(pokemon: pokemon));
    }
  }

  Future<void> removeFromFavoriteList(PokemonInfoEntity pokemon) async {
    List<PokemonInfoEntity> decodedPokemonList =
        await _storage.fetchDecodedFavoritesPokemon() ?? [];

    decodedPokemonList.removeWhere((element) => element.id == pokemon.id);

    final List<String> encodePokemonList =
        decodedPokemonList.map((pokemonInfo) => jsonEncode(pokemonInfo)).toList();
    _storage.saveStringList(encodePokemonList, 'favoritesPokemonList');

    _isFavorite = false;
    emit(PokemonDetailSucess(pokemon: pokemon));
  }

  Future<void> verifyPokemonIsFavorite(PokemonInfoEntity pokemon) async {
    emit(PokemonDetailLoading());
    List<PokemonInfoEntity> favoritesPokemon = await _storage.fetchDecodedFavoritesPokemon() ?? [];
    _isFavorite = favoritesPokemon.any((element) => element.name == pokemon.name);
    emit(PokemonDetailSucess(pokemon: pokemon));
  }

  Future<List<String>?> fetchFavoritesPokemonOnStorage() async =>
      _storage.readStringList('favoritesPokemonList');
}
