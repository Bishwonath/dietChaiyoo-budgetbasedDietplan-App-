import 'package:flutter/material.dart';

ThemeData getapplicationTheme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 196, 19),
      fontFamily: "Montserrat Regular",
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Montserrat Bold'),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 10, 10, 10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          )),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )));
}
