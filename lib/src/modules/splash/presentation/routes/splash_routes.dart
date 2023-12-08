import 'package:go_router/go_router.dart';
import '../pages/splash_page.dart';
import 'splash_paths.dart';

abstract class SplashRoutes {
  static final routes = [
    GoRoute(
      path: SplashPaths.SPLASH_PAGE,
      builder: (context, state) => const SplashPage(),
      name: SplashPaths.SPLASH_PAGE,
    )
  ];
}
