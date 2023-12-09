import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/favorites/presentation/pages/favorites_pokemon_page.dart';
import 'package:poke_app/src/modules/favorites/presentation/routes/favorites_pokemons_paths.dart';

class FavoritesPokemonsRoutes {
  static final routes = [
    GoRoute(
      path: FavoritesPokemonsPaths.FAVORITES_POKEMONS_PAGE,
      builder: (context, state) => const FavoritesPokemonPage(),
      name: FavoritesPokemonsPaths.FAVORITES_POKEMONS_PAGE,
    )
  ];
}
