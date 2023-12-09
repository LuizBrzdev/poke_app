import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/src/modules/favorites/presentation/routes/favorites_pokemons_paths.dart';
import 'package:poke_app/src/modules/home/presentation/routes/home_paths.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';

enum NavigationRoutes {
  homePage(value: HomePaths.HOME_PAGE, pageIndex: 0),
  searchPage(value: SearchPokemonPaths.SEARCH_POKEMON_PAGE, pageIndex: 1),
  favoritePage(value: FavoritesPokemonsPaths.FAVORITES_POKEMONS_PAGE, pageIndex: 2);

  const NavigationRoutes({required this.value, required this.pageIndex});

  final String value;
  final int pageIndex;
}

extension EnumExemploExtension on NavigationRoutes {
  static String getRoute(int index) {
    switch (index) {
      case 0:
        return NavigationRoutes.homePage.value;
      case 1:
        return NavigationRoutes.searchPage.value;
      case 2:
        return NavigationRoutes.favoritePage.value;
      default:
        throw ArgumentError('Índice inválido: $index');
    }
  }
}

class CBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const CBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<CBottomNavigationBar> createState() => _CBottomNavigationBarState();
}

class _CBottomNavigationBarState extends State<CBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (value) async {
            if (value != widget.currentIndex) {
              context.replaceNamed(EnumExemploExtension.getRoute(value));
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(PhosphorIcons.house),
              activeIcon: Icon(PhosphorIcons.house_fill),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(PhosphorIcons.magnifying_glass),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(PhosphorIcons.heart),
              activeIcon: Icon(PhosphorIcons.heart_fill),
            ),
          ],
        ),
      ),
    );
  }
}
