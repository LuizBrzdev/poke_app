import 'package:flutter/material.dart';

import '../../../../shared/components/bottom_navigation_bar/c_bottom_navigation_bar.dart';

class FavoritesPokemonPage extends StatelessWidget {
  const FavoritesPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
      bottomNavigationBar: const CBottomNavigationBar(currentIndex: 2),
    );
  }
}
