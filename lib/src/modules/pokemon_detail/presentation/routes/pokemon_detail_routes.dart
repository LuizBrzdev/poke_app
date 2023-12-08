import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/pages/pokemon_detail_page.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/routes/pokemon_detail_paths.dart';

import '../../../home/domain/entities/pokemon_info_entity.dart';
import '../../data/inject/pokemon_detail_inject.dart';

abstract class PokemonDetailRoutes {
  static final routes = [
    GoRoute(
      path: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
      builder: (context, state) {
        return PokemonDetailPage(
          dependencies: PokemonDetailDependencies(),
          pokemonInfoModel: state.extra as PokemonInfoEntity,
        );
      },
      name: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
    )
  ];
}
