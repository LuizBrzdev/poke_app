import 'package:flutter/material.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

import '../../../../core/helpers/colorByPokemonType/color_by_pokemon_type.dart';

class CPomeonDetailMoves extends StatelessWidget {
  final PokemonInfoEntity pokemonInfoModel;

  const CPomeonDetailMoves({super.key, required this.pokemonInfoModel});

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
      padding: const EdgeInsets.only(top: 8, left: 26, right: 26),
      itemCount: pokemonInfoModel.moves!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorByPokemonType.backGroundColor(type: pokemonInfoModel.types![0].type.name),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Center(
          child: Text(
            pokemonInfoModel.moves![index].move.name,
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
