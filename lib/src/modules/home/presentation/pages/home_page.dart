// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:poke_app/src/core/helpers/colorByPokemonType/color_by_pokemon_type.dart';
import 'package:poke_app/src/modules/home/presentation/cubit/home_cubit.dart';
import 'package:poke_app/src/modules/home/presentation/widgets/c_search_form.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';
import 'package:poke_app/src/shared/components/bottom_navigation_bar/c_bottom_navigation_bar.dart';
import 'package:poke_app/src/shared/components/place_holder/place_holder_image.dart';
import 'package:poke_app/src/shared/utils/HexToColor/color_by_string.dart';
import 'package:poke_app/src/shared/utils/String/string_utils.dart';

import '../../../../shared/components/animated/c_animated_app_bar_widget.dart';
import '../../../../shared/components/shimmer/c_shimmer.dart';
import '../../../pokemon_detail/presentation/routes/pokemon_detail_paths.dart';

class HomePage extends StatelessWidget {
  final HomeCubit _cubit;
  const HomePage({
    Key? key,
    required HomeCubit cubit,
  })  : _cubit = cubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

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
                  'Pokédex',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: HexToColor.toColor('#404040')),
                ),
                const SizedBox(height: 8),
                Text(
                  'Procure por um pokémon usando seu nome ou numero registrado na Pokédex',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: HexToColor.toColor('#404040')),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => context.replaceNamed(SearchPokemonPaths.SEARCH_POKEMON_PAGE),
                  child: const CSearchForm(
                    enabled: false,
                    title: 'Nome ou Numero do seu Pokémon...',
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state.homeStatesStatus == HomeStatesStatus.loading) {
                      return GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        children: List.generate(
                          state.listOfPokemons.isEmpty ? 12 : state.listOfPokemons.length,
                          (index) => CShimmer(
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: state.listOfPokemons.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => context.pushNamed(
                            PokemonDetailPaths.POKEMON_DETAIL_PAGE,
                            extra: state.listOfPokemons[index],
                          ),
                          child: Material(
                            child: Hero(
                              tag: state.listOfPokemons[index].name.toString(),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: ColorByPokemonType.backGroundColor(
                                      type: state.listOfPokemons[index].types![0].type.name),
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
                                        imageUrl: state.listOfPokemons[index].sprites!.other
                                            .officialartwork.frontDefault,
                                        errorWidget: (context, url, error) =>
                                            const PlaceHolderImage(),
                                      ),
                                    ),
                                    Text(
                                      StringUtils.upperCaseFirstLetter(
                                          state.listOfPokemons[index].name!),
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      state.listOfPokemons[index].id.toString().padLeft(3, '0'),
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
                  },
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state.homeStatesStatus != HomeStatesStatus.loading) {
                      return InkWell(
                        onTap: () async {
                          await _cubit.fetchListOfPokemonsByUrl();
                          _cubit.fetchPokemonInfo();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ver mais',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              PhosphorIcons.caret_down,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
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
                  'Nome ou numero do seu Pokémon...',
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: const CBottomNavigationBar(currentIndex: 0),
    );
  }
}
