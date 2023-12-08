import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CNavigationButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final double? iconSize;
  final Color? color;

  const CNavigationButton({
    super.key,
    this.icon = PhosphorIcons.caret_left,
    this.iconSize,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: color,
          ),
        ),
      ),
    );
  }
}
