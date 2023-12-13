import 'package:flutter/material.dart';
import 'package:poke_app/src/modules/search/presentation/routes/search_pokemon_paths.dart';

import '../../../../shared/components/bottom_navigation_bar/c_bottom_navigation_bar.dart';
import '../../../home/presentation/widgets/c_search_form.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SafeArea(child: SizedBox(height: 20)),
          CSearchForm(
            title: 'Nome ou Numero do seu Pokémon favorito...',
            padding: const EdgeInsets.symmetric(horizontal: 20),
            controller: searchController,
            onChanged: (value) {},
          ),
        ],
      )),
      bottomNavigationBar:
          const CBottomNavigationBar(currentRoute: SearchPokemonPaths.SEARCH_POKEMON_PAGE),
    );
  }
}
