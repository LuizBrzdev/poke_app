import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/favorites/presentation/cubit/favorites_pokemons_cubit.dart';

import '../../../../core/helpers/colorByPokemonType/color_by_pokemon_type.dart';
import '../../../../shared/components/animated/c_animated_app_bar_widget.dart';
import '../../../../shared/components/bottom_navigation_bar/c_bottom_navigation_bar.dart';
import '../../../../shared/components/place_holder/place_holder_image.dart';
import '../../../../shared/components/shimmer/c_shimmer.dart';
import '../../../../shared/utils/HexToColor/color_by_string.dart';
import '../../../../shared/utils/String/string_utils.dart';
import '../../../home/presentation/widgets/c_search_form.dart';
import '../../../pokemon_detail/presentation/routes/pokemon_detail_paths.dart';

class FavoritesPokemonPage extends StatelessWidget {
  const FavoritesPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final cubit = GetIt.I<FavoritesPokemonsCubit>();

    cubit.fetchFavoritesPokemon();

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Favoritos',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: HexToColor.toColor('#404040')),
                ),
                const SizedBox(height: 8),
                Text(
                  'Aqui estão seus Pokemons favoritos',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: HexToColor.toColor('#404040')),
                ),
                const SizedBox(height: 20),
                const CSearchForm(),
                BlocBuilder<FavoritesPokemonsCubit, FavoritesPokemonsState>(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is FavoritesPokemonLoading) {
                      return GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        children: List.generate(
                          12,
                          (index) => CShimmer(
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      );
                    }
                    if (state is FavoritesPokemonSucess) {
                      return GridView.builder(
                        itemCount: state.listOfFavoritesPokemons.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            context.pushNamed(
                              PokemonDetailPaths.POKEMON_DETAIL_PAGE,
                              extra: state.listOfFavoritesPokemons[index],
                            );
                          },
                          child: Material(
                            child: Hero(
                              tag: state.listOfFavoritesPokemons[index].name.toString(),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: ColorByPokemonType.backGroundColor(
                                      type:
                                          state.listOfFavoritesPokemons[index].types![0].type.name),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      offset: const Offset(0, 6),
                                      blurRadius: 24,
                                      spreadRadius: -6,
                                      blurStyle: BlurStyle.inner,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: CachedNetworkImage(
                                        height: MediaQuery.of(context).size.height * 0.14,
                                        fit: BoxFit.cover,
                                        imageUrl: state.listOfFavoritesPokemons[index].sprites!
                                            .other.officialartwork.frontDefault,
                                        errorWidget: (context, url, error) =>
                                            const PlaceHolderImage(),
                                      ),
                                    ),
                                    Text(
                                      StringUtils.upperCaseFirstLetter(
                                          state.listOfFavoritesPokemons[index].name!),
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      state.listOfFavoritesPokemons[index].id
                                          .toString()
                                          .padLeft(3, '0'),
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const SafeArea(
                  child: SizedBox(height: 10),
                ),
              ],
            ),
          ),
          CAnimatedAppBarWidget(
            enableSafeArea: false,
            scrollController: scrollController,
            children: const [
              Icon(PhosphorIcons.magnifying_glass_bold, size: 18),
              SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Nome ou numero do seu Pokémon favorito...',
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const CBottomNavigationBar(currentIndex: 2),
    );
  }
}
