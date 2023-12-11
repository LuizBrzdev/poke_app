part of 'favorites_pokemons_cubit.dart';

@immutable
sealed class FavoritesPokemonsState {}

final class FavoritesPokemonsInitial extends FavoritesPokemonsState {}

final class FavoritesPokemonLoading extends FavoritesPokemonsState {}

final class FavoritesPokemonEmpty extends FavoritesPokemonsState {}

final class FavoritesPokemonSucess extends FavoritesPokemonsState {
  final List<PokemonInfoEntity> listOfFavoritesPokemons;

  FavoritesPokemonSucess(this.listOfFavoritesPokemons);
}
