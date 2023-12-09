import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_pokemons_state.dart';

class FavoritesPokemonsCubit extends Cubit<FavoritesPokemonsState> {
  FavoritesPokemonsCubit() : super(FavoritesPokemonsInitial());
}
