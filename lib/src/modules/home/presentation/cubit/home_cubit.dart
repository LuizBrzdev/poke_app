import 'package:bloc/bloc.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';

import 'package:poke_app/src/modules/home/domain/usecases/fetch_pokemon_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FetchPokemonUseCase _fetchPokemonUseCase;

  PokemonBasicEntity _pokemonBasicEntity = PokemonBasicEntity();

  HomeCubit(this._fetchPokemonUseCase) : super(HomeState()) {
    initState();
  }

  Future<void> initState() async {
    await fetchPokemonsList();
    await fetchPokemonInfo();
  }

  Future<void> fetchListOfPokemonsByUrl() async {
    emit(
      state.copyWith(
        homeStatesStatus: HomeStatesStatus.loading,
      ),
    );
    final response = await _fetchPokemonUseCase.fetchPokemonByUrl(url: _pokemonBasicEntity.next!);

    _pokemonBasicEntity = response!;
    emit(
      state.copyWith(
        pokemonBasicEntity: response,
        homeStatesStatus: HomeStatesStatus.sucess,
      ),
    );
  }

  Future<void> fetchPokemonsList() async {
    final response = await _fetchPokemonUseCase.fetchPokemonsList();
    _pokemonBasicEntity = response!;
  }

  Future<void> fetchPokemonInfo() async {
    emit(
      state.copyWith(
          homeStatesStatus: HomeStatesStatus.loading, pokemonBasicEntity: _pokemonBasicEntity),
    );
    _pokemonBasicEntity = state.pokemonBasicEntity!;
    List<PokemonInfoEntity> mutableList = List<PokemonInfoEntity>.from(state.listOfPokemons);
    for (PokemonResultsEntity pokemon in _pokemonBasicEntity.results!) {
      final pokemonInfo = await _fetchPokemonUseCase.fetchPokemonInfo(pokemonName: pokemon.name!);
      if (pokemonInfo.runtimeType == PokemonInfoEntity) {
        mutableList.add(pokemonInfo!);
        emit(
          state.copyWith(
            listOfPokemons: mutableList,
            homeStatesStatus: HomeStatesStatus.sucess,
          ),
        );
      }
    }
  }
}
