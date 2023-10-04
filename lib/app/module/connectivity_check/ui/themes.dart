import 'package:flutter/material.dart';

class SimpleTheme {
  ThemeData defaultAppTheme() {
    return ThemeData(
        colorScheme: simpleLightScheme(),
        useMaterial3: true,
        checkboxTheme: customCheckBox,
        scaffoldBackgroundColor: simpleLightScheme().background);
  }

  ElevatedButtonThemeData get elevatedButtonTheme =>
      const ElevatedButtonThemeData(style: ButtonStyle());

  CheckboxThemeData get customCheckBox => CheckboxThemeData(
        side: BorderSide(
          color: simpleLightScheme().onBackground,
          width: 4,
          style: BorderStyle.solid,
        ),
      );

  ColorScheme simpleLightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF94D8D4),
      onPrimary: Color(0xff322E3F),
      secondary: Color(0xff8DDED9),
      onSecondary: Color(0xff322E3F),
      error: Color(0xffba1a1a),
      onError: Color(0xffEEEEEE),
      background: Color(0xffEEEEEE),
      onBackground: Color(0xff322E3F),
      surface: Color(0xffffffff),
      onSurface: Color(0xff322E3F),
    );
  }
}
