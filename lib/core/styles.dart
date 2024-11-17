import 'package:flutter/material.dart';

import 'colorsmnager.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsManager.mainBlue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: ColorsManager.mainBlue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, color: Colors.black),
      titleLarge: TextStyle(fontSize: 14, color: Colors.grey),
      labelLarge: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsManager.mainBlue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(fontSize: 14, color: Colors.grey),
      labelLarge: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
