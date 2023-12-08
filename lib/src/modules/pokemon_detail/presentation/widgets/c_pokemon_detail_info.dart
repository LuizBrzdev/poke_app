import 'package:flutter/material.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

import '../../../../shared/utils/String/string_utils.dart';
import '../../../../shared/utils/numbers/numbers_util.dart';
import 'c_base_container_info.dart';

class CPokemonDetailInfo extends StatelessWidget {
  final PokemonInfoEntity pokemonInfoModel;
  const CPokemonDetailInfo({super.key, required this.pokemonInfoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          CBaseContainerInfo(
            title: 'Numero: ${pokemonInfoModel.id}',
            pokemonInfoModel: pokemonInfoModel,
          ),
          CBaseContainerInfo(
            title: 'Nome: ${StringUtils.upperCaseFirstLetter(pokemonInfoModel.name!)}',
            pokemonInfoModel: pokemonInfoModel,
          ),
          CBaseContainerInfo(
            title:
                'Altura: ${NumbersUtil.changePokemonInfoToDecimalDigit(pokemonInfoModel.height!)}m',
            pokemonInfoModel: pokemonInfoModel,
          ),
          CBaseContainerInfo(
            title:
                'Peso: ${NumbersUtil.changePokemonInfoToDecimalDigit(pokemonInfoModel.weight!)}Kg',
            pokemonInfoModel: pokemonInfoModel,
          ),
          CBaseContainerInfo(
            title: 'Experiencia base: ${pokemonInfoModel.baseExperience}',
            pokemonInfoModel: pokemonInfoModel,
          ),
        ],
      ),
    );
  }
}
