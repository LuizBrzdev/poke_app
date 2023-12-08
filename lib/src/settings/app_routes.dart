// ignore_for_file: non_constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/routes/pokemon_detail_routes.dart';
import '../modules/home/presentation/routes/home_routes.dart';
import '../modules/splash/presentation/routes/splash_routes.dart';

abstract class AppRoutes {
  static final appRoutes = GoRouter(
    routes: [
      ...SplashRoutes.routes,
      ...HomeRoutes.routes,
      ...PokemonDetailRoutes.routes,
    ],
  );
}
