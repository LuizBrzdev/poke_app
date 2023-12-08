import 'package:get_it/get_it.dart';
import 'package:poke_app/src/modules/home/data/datasource/home_data_source.dart';
import 'package:poke_app/src/modules/home/domain/usecases/fetch_pokemon_use_case.dart';
import 'package:poke_app/src/modules/home/presentation/cubit/home_cubit.dart';

import '../../domain/repository/home_repository.dart';
import '../repository/home_repository_imp.dart';

class HomeDependecies {
  static bool _initialized = false;

  HomeDependecies() {
    if (!_initialized) {
      GetIt getIt = GetIt.instance;
      getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource(getIt()));
      getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt()));
      getIt.registerLazySingleton<FetchPokemonUseCase>(
          () => FetchPokemonUseCase(homeRepository: getIt()));
      getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
      _initialized = true;
    }
  }
}
