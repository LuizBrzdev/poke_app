import 'package:get_it/get_it.dart';

import '../../presentation/cubits/cubit/pokemon_detail_cubit.dart';

class PokemonDetailDependencies {
  PokemonDetailDependencies() {
    GetIt getIt = GetIt.instance;
    if (!getIt.isRegistered<PokemonDetailCubit>()) {
      getIt.registerLazySingleton<PokemonDetailCubit>(() => PokemonDetailCubit());
    }
  }
}
