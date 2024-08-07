import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/home/data/bindings/home_bindings.dart';
import '../cubit/home_cubit.dart';
import '../pages/home_page.dart';
import 'home_paths.dart';

abstract class HomeRoutes {
  static final GetIt getIt = GetIt.instance;
  static final routes = [
    GoRoute(
      path: HomePaths.HOME_PAGE,
      builder: (context, state) {
        if (!getIt.hasScope('home')) {
          HomeBindings.init();
        }
        return HomePage(cubit: GetIt.instance<HomeCubit>());
      },
      name: HomePaths.HOME_PAGE,
      onExit: (context) {
        getIt.resetScope();
        return true;
      },
    ),
  ];
}
