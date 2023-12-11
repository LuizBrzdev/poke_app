import 'package:get_it/get_it.dart';
import 'package:poke_app/src/modules/favorites/presentation/cubit/favorites_pokemons_cubit.dart';

class FavoritesPokemonsBindings {
  static void init() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<FavoritesPokemonsCubit>(() => FavoritesPokemonsCubit(getIt()));
  }
}
