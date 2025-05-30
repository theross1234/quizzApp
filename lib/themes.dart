import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(

  fontFamily: GoogleFonts.nunito().fontFamily,
  useMaterial3: true, // Enable Material 3 (optional)
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18), // Replaces bodyText1
    bodyMedium: TextStyle(fontSize: 16), // Replaces bodyText2
    labelLarge: TextStyle( // Replaces button
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle( // Replaces headline1
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle( // Replaces subtitle1
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData( // Replaces ButtonThemeData
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
