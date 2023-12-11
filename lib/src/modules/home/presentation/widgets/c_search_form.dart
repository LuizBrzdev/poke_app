import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../../shared/utils/HexToColor/color_by_string.dart';

class CSearchForm extends StatelessWidget {
  final String title;
  final bool enabled;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const CSearchForm(
      {super.key, required this.title, this.enabled = true, this.onChanged, this.controller});

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
            Expanded(
                child: TextField(
              enabled: enabled,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration.collapsed(
                hintText: title,
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                  color: HexToColor.toColor('#404040'),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
