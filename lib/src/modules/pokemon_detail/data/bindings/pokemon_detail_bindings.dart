import 'package:get_it/get_it.dart';

import '../../presentation/cubits/cubit/pokemon_detail_cubit.dart';

class PokemonDetailBindings {
  static void init() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<PokemonDetailCubit>(() => PokemonDetailCubit(getIt()));
  }
}
