import 'package:flutter/material.dart';

import '../../../../core/helpers/colorByPokemonType/color_by_pokemon_type.dart';
import '../../../home/domain/entities/pokemon_info_entity.dart';

class CPokemonDetailStats extends StatelessWidget {
  final PokemonInfoEntity pokemonInfoModel;
  const CPokemonDetailStats({super.key, required this.pokemonInfoModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 68,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 16 / 9,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pokemonInfoModel.stats!.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8, left: 26, right: 26),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorByPokemonType.backGroundColor(type: pokemonInfoModel.types![0].type.name),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Center(
          child: Text(
            '${pokemonInfoModel.stats![index].stat.name} : ${pokemonInfoModel.stats![index].baseStat.toString()}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
