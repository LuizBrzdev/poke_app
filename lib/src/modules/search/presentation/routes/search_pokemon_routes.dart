import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';

import '../pages/search_pokemon_page.dart';

abstract class SearchPokemonRoutes {
  static final routes = [
    GoRoute(
      path: SearchPokemonPaths.SEARCH_POKEMON_PAGE,
      builder: (context, state) => const SearchPokemonPage(),
      name: SearchPokemonPaths.SEARCH_POKEMON_PAGE,
    )
  ];
}
