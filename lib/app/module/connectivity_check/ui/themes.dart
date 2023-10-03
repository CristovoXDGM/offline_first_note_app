import 'package:flutter/material.dart';

class SimpleTheme {
  ThemeData defaultAppTheme() {
    return ThemeData(
        colorScheme: simpleLightScheme(),
        useMaterial3: true,
        checkboxTheme: customCheckBox,
        scaffoldBackgroundColor: simpleLightScheme().onPrimary);
  }

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
      onPrimary: Color(0xffEEEEEE),
      secondary: Color(0xff8DDED9),
      onSecondary: Color(0xffEEEEEE),
      error: Color(0xffba1a1a),
      onError: Color(0xffEEEEEE),
      background: Color(0xfff8fdff),
      onBackground: Color(0xff001f25),
      surface: Color(0xfff8fdff),
      onSurface: Color(0xff001f25),
    );
  }
}
