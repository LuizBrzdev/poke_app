import 'package:get_it/get_it.dart';
import 'package:poke_app/src/modules/home/data/datasource/home_data_source_imp.dart';
import 'package:poke_app/src/modules/home/domain/usecases/fetch_pokemon_use_case.dart';
import 'package:poke_app/src/modules/home/domain/usecases/fetch_pokemon_use_case_imp.dart';
import 'package:poke_app/src/modules/home/presentation/cubit/home_cubit.dart';

import '../../external/datasource/home_data_source.dart';
import '../repository/home_repository_imp.dart';
import '../../domain/repository/home_repository.dart';

class HomeBindings {
  static void init() {
    final getIt = GetIt.I;
    getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImp(getIt()));
    getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt()));
    getIt.registerLazySingleton<FetchPokemonUseCase>(
        () => FetchPokemonUseCaseImp(homeRepository: getIt()));
    getIt.registerLazySingleton(() => HomeCubit(getIt()));
  }
}
