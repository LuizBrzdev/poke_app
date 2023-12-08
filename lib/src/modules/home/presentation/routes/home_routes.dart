import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import 'home_paths.dart';

abstract class HomeRoutes {
  static final routes = [
    GoRoute(
      path: HomePaths.HOME_PAGE,
      builder: (context, state) => const HomePage(),
      name: HomePaths.HOME_PAGE,
    )
  ];
}
