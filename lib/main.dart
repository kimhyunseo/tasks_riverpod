import 'package:flutter/material.dart';
import 'package:tasks/ui/pages/home/home_page.dart';
import 'package:tasks/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hyunseo's Tasks",
      themeMode: _themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(toggleTheme: toggleTheme, themeMode: _themeMode),
    );
  }
}
