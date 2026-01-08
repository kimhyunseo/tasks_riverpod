import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.grey.shade400,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.light,
    surfaceContainer: Colors.white54,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    iconSize: 24,
    shape: const CircleBorder(),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black54)),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.dark,
    surfaceContainer: Colors.white12,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    iconSize: 24,
    shape: const CircleBorder(),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white60)),
  ),
);
