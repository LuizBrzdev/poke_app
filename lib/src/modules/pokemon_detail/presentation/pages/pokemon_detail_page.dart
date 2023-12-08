// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:poke_app/src/shared/components/buttons/c_navigation_button.dart';

import '../../../../shared/utils/HexToColor/color_by_string.dart';
import '../../../../core/helpers/colorByPokemonType/color_by_pokemon_type.dart';
import '../../../../shared/components/animated/c_animated_app_bar_widget.dart';
import '../../../../shared/components/expandable_page_view/expandable_page_view.dart';
import '../../../../shared/components/place_holder/place_holder_image.dart';
import '../../../home/domain/entities/pokemon_info_entity.dart';
import '../../../../settings/bindings/features/pokemon_detail_bindings.dart';
import '../widgets/c_pokemon_detail_abilities.dart';
import '../widgets/c_pokemon_detail_info.dart';
import '../widgets/c_pokemon_detail_stats.dart';
import '../widgets/c_pomeon_detail_moves.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonInfoEntity pokemonInfoModel;
  final PokemonDetailBindings pokemonDetailBindings;

  const PokemonDetailPage({
    Key? key,
    required this.pokemonInfoModel,
    required this.pokemonDetailBindings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    // final PokemonDetailCubit cubit = GetIt.I<PokemonDetailCubit>();

    return Material(
      color: HexToColor.toColor('#EDEDED'),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CNavigationButton(color: Colors.black, onTap: () => context.pop()),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            pokemonInfoModel.name!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            pokemonInfoModel.id.toString().padLeft(3, '0'),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorByPokemonType.backGroundColor(
                        type: pokemonInfoModel.types![0].type.name),
                  ),
                  child: Hero(
                    tag: pokemonInfoModel.name.toString(),
                    child: Center(
                      child: CachedNetworkImage(
                        height: MediaQuery.of(context).size.height * 0.25,
                        imageUrl: pokemonInfoModel.sprites!.other.officialartwork.frontDefault,
                        errorWidget: (context, url, error) => const PlaceHolderImage(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PokemonDetailTabBar(
                  pokemonInfoModel: pokemonInfoModel,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          CAnimatedAppBarWidget(
            scrollController: scrollController,
            targetNumberToAnimate: 80,
            children: [
              CNavigationButton(color: Colors.black, onTap: () => context.pop()),
              Flexible(
                child: Center(
                  child: Text(
                    pokemonInfoModel.name!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PokemonDetailTabBar extends StatefulWidget {
  final PokemonInfoEntity pokemonInfoModel;

  PokemonDetailTabBar({
    Key? key,
    required this.pokemonInfoModel,
  }) : super(key: key);

  @override
  State<PokemonDetailTabBar> createState() => _PokemonDetailTabBarState();
}

class _PokemonDetailTabBarState extends State<PokemonDetailTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final PageController pageController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
      animationDuration: const Duration(milliseconds: 400),
    );
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          labelStyle: const TextStyle(
            fontFamily: 'DMSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black.withOpacity(0.3),
          indicatorColor: Colors.transparent,
          splashBorderRadius: BorderRadius.circular(4),
          onTap: (value) {
            pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
            );
          },
          overlayColor: MaterialStateColor.resolveWith(
            (states) => ColorByPokemonType.backGroundColor(
                type: widget.pokemonInfoModel.types![0].type.name),
          ),
          isScrollable: false,
          tabs: const [
            Text('Info'),
            Text('Moves'),
            Text('Stats'),
            Text('Forms'),
          ],
        ),
        ExpandablePageView(
          controller: pageController,
          children: [
            CPokemonDetailInfo(pokemonInfoModel: widget.pokemonInfoModel),
            CPomeonDetailMoves(pokemonInfoModel: widget.pokemonInfoModel),
            CPokemonDetailStats(pokemonInfoModel: widget.pokemonInfoModel),
            CPokemonDetailForms(pokemonInfoModel: widget.pokemonInfoModel)
          ],
        ),
      ],
    );
  }
}
