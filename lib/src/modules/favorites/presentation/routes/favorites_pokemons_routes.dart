import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/favorites/presentation/pages/favorites_pokemon_page.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/routes/pokemon_detail_paths.dart';

class FavoritesPokemonsRoutes {
  static final routes = [
    GoRoute(
      path: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
      builder: (context, state) => const FavoritesPokemonPage(),
      name: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
    )
  ];
}
