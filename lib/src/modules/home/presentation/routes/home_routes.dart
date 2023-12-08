import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/home/data/inject/home_inject.dart';
import '../pages/home_page.dart';
import 'home_paths.dart';

abstract class HomeRoutes {
  GetIt getIt = GetIt.instance;
  static final routes = [
    GoRoute(
      path: HomePaths.HOME_PAGE,
      builder: (context, state) => HomePage(homeDependecies: HomeDependecies()),
      name: HomePaths.HOME_PAGE,
    )
  ];
}
