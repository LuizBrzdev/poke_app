import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part '../states/pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  int currentIndexOfTab = 0;

  PokemonDetailCubit() : super(PokemonDetailInitial());
}
