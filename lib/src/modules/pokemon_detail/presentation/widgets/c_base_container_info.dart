import 'package:flutter/material.dart';

import '../../../../core/helpers/colorByPokemonType/color_by_pokemon_type.dart';
import '../../../home/domain/entities/pokemon_info_entity.dart';

class CBaseContainerInfo extends StatelessWidget {
  final String title;
  final PokemonInfoEntity pokemonInfoModel;

  const CBaseContainerInfo({super.key, required this.title, required this.pokemonInfoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorByPokemonType.backGroundColor(type: pokemonInfoModel.types![0].type.name),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
