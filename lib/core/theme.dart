import 'package:flutter/material.dart';
import 'package:linkedin/core/theme/app_colors.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Palette.buttonColor),
      foregroundColor: WidgetStateProperty.all(Palette.backgroundColor),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.buttonColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.lightGray,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Palette.backgroundColor,
    foregroundColor: Palette.darkGray,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Palette.buttonColor,
    ),
  ),
);
