part of 'home_cubit.dart';

enum HomeStatesStatus { initial, loading, sucess, failure }

class HomeState {
  final HomeStatesStatus homeStatesStatus;
  final List<PokemonInfoEntity> listOfPokemons;
  final PokemonBasicEntity? pokemonBasicEntity;

  HomeState({
    this.homeStatesStatus = HomeStatesStatus.initial,
    this.listOfPokemons = const [],
    this.pokemonBasicEntity,
  });

  HomeState copyWith({
    HomeStatesStatus? homeStatesStatus,
    final List<PokemonInfoEntity>? listOfPokemons,
    final PokemonBasicEntity? pokemonBasicEntity,
  }) {
    return HomeState(
        homeStatesStatus: homeStatesStatus ?? this.homeStatesStatus,
        listOfPokemons: listOfPokemons ?? this.listOfPokemons,
        pokemonBasicEntity: pokemonBasicEntity ?? PokemonBasicEntity());
  }
}
