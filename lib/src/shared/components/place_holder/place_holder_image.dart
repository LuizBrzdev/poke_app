import 'package:flutter/material.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      maxRadius: 40,
      backgroundImage: AssetImage(
        'assets/images/pikachu-sad.gif',
      ),
    );
  }
}
