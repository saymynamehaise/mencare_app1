import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF111111),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2F8A8A),
      secondary: Color(0xFFB85A2F),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'Arial', color: Colors.white70),
    ),
  );
}
