import 'package:flutter/material.dart';

class MThemeData {
  MThemeData._();

  static final mDarkThemeData = ThemeData(
      fontFamily: "Oswald-xlight",
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      textTheme: const TextTheme().copyWith(
          headlineSmall: const TextStyle().copyWith(fontFamily: "Oswald"),
          displayLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.white)));

  static final mLightThemeData = ThemeData(
      fontFamily: "Oswald",
      brightness: Brightness.light,
      primaryColor: Colors.black,
      textTheme: const TextTheme().copyWith(
          headlineMedium: const TextStyle().copyWith(fontFamily: "Oswald"),
          displayLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      )));
}
