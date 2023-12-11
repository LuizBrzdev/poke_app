part of '../cubit/pokemon_detail_cubit.dart';

@immutable
sealed class PokemonDetailState {}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonDetailLoading extends PokemonDetailState {}

final class PokemonDetailSucess extends PokemonDetailState {
  final PokemonInfoEntity pokemon;

  PokemonDetailSucess({required this.pokemon});
}
