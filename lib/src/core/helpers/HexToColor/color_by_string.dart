import 'package:flutter/material.dart';

class HexToColor {
  static Color toColor(String code) {
    code = code.replaceAll('#', '');
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }
}
