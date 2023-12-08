import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData theme = ThemeData(
    fontFamily: 'DMSans',
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
