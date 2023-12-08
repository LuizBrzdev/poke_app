import 'package:bloc/bloc.dart';

import '../states/pokemon_detail_ui_states.dart';

class PokemonDetailUiCubit extends Cubit<PokemonDetailUiState> {
  PokemonDetailUiCubit() : super(PokemonDetailUiStateInitial());
}
