import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade200,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey[300],
    displayColor: Colors.white,
  ),
);
