import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../cubit/home_cubit.dart';
import '../pages/home_page.dart';
import 'home_paths.dart';

abstract class HomeRoutes {
  static final routes = [
    GoRoute(
      path: HomePaths.HOME_PAGE,
      builder: (context, state) => HomePage(cubit: GetIt.instance<HomeCubit>()),
      name: HomePaths.HOME_PAGE,
    )
  ];
}
