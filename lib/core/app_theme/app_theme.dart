import 'package:flutter/material.dart';

ThemeData getapplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor:
        const Color(0xFFF5F5DC), // Light beige for background
    fontFamily: "Montserrat Regular",
    iconTheme: const IconThemeData(
      color:
          Color(0xFFE07B39), // Set the icon color here (example: primary color)
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light, // Specify brightness (light or dark)
      primary: Color(
          0xFFE07B39), // Primary color for app (used in AppBar, buttons, etc.)
      secondary: Color(0xFFE07B39), // Background color
      surface: Color(0xFFF5F5DC), // Text color for background
      onSurface: Colors.black, // Text color for surfaces
      onError: Colors.white, // Text color for error states
      error: Colors.red, // Color for error states
      onPrimary: Colors.white, // Text color for primary elements
      onSecondary: Colors.white, // Text color for secondary elements
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat Bold',
        ),
        backgroundColor:
            const Color(0xFFE07B39), // Primary color for button background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(15),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFB6A28E), // Muted brown for input borders
        ),
      ),
      labelStyle: TextStyle(
        fontSize: 20,
        color: Color(0xFFE07B39), // Orange for labels
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFE07B39), // Orange for error borders
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFB6A28E), // Muted brown for focused borders
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE07B39), // Primary orange for app bar
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFFF5F5DC), // Light beige for app bar title
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(
            0xFFE07B39), // Set default color to primary orange for headlines
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color(0xFF333333), // Default text color (dark gray)
      ),
    ),
  );
}
