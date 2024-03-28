import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      searchBarTheme: SearchBarThemeData(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          backgroundColor: MaterialStatePropertyAll(Color(0xFF363636)),
          surfaceTintColor: MaterialStatePropertyAll(Color(0x00000000)),
          textStyle:
          MaterialStatePropertyAll(TextStyle(color: Color(0xFF929292)))),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          )),
      colorScheme: const ColorScheme(
        primary: Colors.yellow,
        // Primary color (typically used for buttons, the app bar, etc.),
        // A darker version of the primary color, used for certain elements
        secondary: Colors.greenAccent,
        // Secondary color (typically used for FAB, selection controls, etc.),
        // A darker version of the secondary color, used for certain elements
        surface: Colors.white,
        // Surface color (background color of surfaces such as cards)
        background: Color(0xFF1b1b1b),
        // Background color (overall background color of the app)
        error: Colors.redAccent,
        // Error color (typically used to indicate errors or validation issues)
        onPrimary: Colors.white,
        // Color for elements that are on top of the primary color
        onSecondary: Colors.white,
        // Color for elements that are on top of the secondary color
        onSurface: Colors.white,
        // Color for elements that are on top of the surface color
        onBackground: Colors.white,
        // Color for elements that are on top of the background color
        onError: Colors.white,
        // Color for elements that are on top of the error color
        brightness:
        Brightness.dark, // Brightness of the color scheme (light or dark)
      ),
    );
  }
}