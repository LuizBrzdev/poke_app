import 'package:flutter/material.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';

import '../../../../shared/components/bottom_navigation_bar/c_bottom_navigation_bar.dart';

class SearchPokemonPage extends StatelessWidget {
  const SearchPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
      bottomNavigationBar:
          const CBottomNavigationBar(currentRoute: SearchPokemonPaths.SEARCH_POKEMON_PAGE),
    );
  }
}
