import 'package:flutter/material.dart';
import 'package:linkedin/core/theme/app_colors.dart';
// Make sure to import your palette file

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,

  // textTheme: TextTheme(
  //   headline1: TextStyle(color: Palette.darkGrayText, fontSize: 24, fontWeight: FontWeight.bold),
  //   bodyText1: TextStyle(color: Palette.darkGrayText, fontSize: 16),
  //   bodyText2: TextStyle(color: Palette.secondaryTextColor, fontSize: 14),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Palette.buttonColor),
      foregroundColor: WidgetStateProperty.all(Palette.backgroundColor),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Palette.buttonColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Palette.lightGray,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.backgroundColor,
    foregroundColor: Palette.darkGray,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Palette.buttonColor,
    ),
  ),
);
