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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFFE07B39), // Light beige for button text
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat Bold',
        ),
        backgroundColor:
            const Color(0xFFE07B39), // Primary orange for button background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
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
  );
}
