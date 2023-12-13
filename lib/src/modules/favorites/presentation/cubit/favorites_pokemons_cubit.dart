import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poke_app/src/core/services/storage/domain/storage.dart';

import '../../../home/domain/entities/pokemon_info_entity.dart';

part 'favorites_pokemons_state.dart';

class FavoritesPokemonsCubit extends Cubit<FavoritesPokemonsState> {
  FavoritesPokemonsCubit(this._storage) : super(FavoritesPokemonLoading());

  List<PokemonInfoEntity> _pokemonList = [];

  final Storage _storage;

  Future<void> fetchFavoritesPokemon() async {
    emit(FavoritesPokemonLoading());
    _pokemonList = await _storage.fetchDecodedFavoritesPokemon() ?? [];
    getPokemonList(_pokemonList);
  }

  void filterPokemons(String value) {
    List<PokemonInfoEntity> filterList = _pokemonList
        .where((element) =>
            element.name!.contains(value.toLowerCase()) ||
            element.id.toString().padLeft(3, '0').contains(value))
        .toList();

    getPokemonList(filterList);
  }

  void getPokemonList(List<PokemonInfoEntity> pokemonList) {
    emit(FavoritesPokemonLoading());
    if (pokemonList.isEmpty) {
      emit(FavoritesPokemonEmpty());
    } else {
      emit(FavoritesPokemonSucess(pokemonList));
    }
  }
}
