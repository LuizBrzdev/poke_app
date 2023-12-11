import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poke_app/src/core/services/storage/domain/storage_interface.dart';

import '../../../home/domain/entities/pokemon_info_entity.dart';

part 'favorites_pokemons_state.dart';

class FavoritesPokemonsCubit extends Cubit<FavoritesPokemonsState> {
  FavoritesPokemonsCubit(this._storage) : super(FavoritesPokemonsInitial());

  final StorageInterface _storage;

  Future<void> fetchFavoritesPokemon() async {
    emit(FavoritesPokemonLoading());
    List<PokemonInfoEntity> pokemonList = await _storage.fetchDecodedFavoritesPokemon() ?? [];
    emit(FavoritesPokemonSucess(pokemonList));
  }
}
