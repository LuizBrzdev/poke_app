import 'package:flutter/material.dart';

@immutable
sealed class PokemonDetailUiState {}

final class PokemonDetailUiStateInitial implements PokemonDetailUiState {
//void changeAppBarState(){}

  PokemonDetailUiStateInitial();
}

final class PokemonDetailUiStateAppBarEvent implements PokemonDetailUiState {
  final bool showAppBar;

  PokemonDetailUiStateAppBarEvent({required this.showAppBar});
}
