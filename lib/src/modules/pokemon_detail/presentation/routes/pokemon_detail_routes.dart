import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/cubits/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/pages/pokemon_detail_page.dart';
import 'package:poke_app/src/modules/pokemon_detail/presentation/routes/pokemon_detail_paths.dart';

import '../../../home/domain/entities/pokemon_info_entity.dart';

abstract class PokemonDetailRoutes {
  static final routes = [
    GoRoute(
      path: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
      builder: (context, state) => PokemonDetailPage(
        pokemonInfoModel: state.extra as PokemonInfoEntity,
        cubit: GetIt.I<PokemonDetailCubit>(),
      ),
      name: PokemonDetailPaths.POKEMON_DETAIL_PAGE,
    )
  ];
}
