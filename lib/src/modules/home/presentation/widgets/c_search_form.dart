import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../../core/helpers/HexToColor/color_by_string.dart';

class CSearchForm extends StatelessWidget {
  const CSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: HexToColor.toColor('#EDEDED'),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 6),
            blurRadius: 24,
            spreadRadius: -6,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(PhosphorIcons.magnifying_glass_bold, size: 20),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                'Nome ou Numero do seu Pokémon favorito...',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                  color: HexToColor.toColor('#404040'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
