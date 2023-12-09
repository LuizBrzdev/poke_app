import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/routes/pokemon_detail_paths.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';

import '../pages/search_pokemon_page.dart';

abstract class SearchPokemonRoutes {
  static final routes = [
    GoRoute(
      path: SearchPokemonPaths.POKEMON_DETAIL_PAGE,
      builder: (context, state) => const SearchPokemonPage(),
      name: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
    )
  ];
}
