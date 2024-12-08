import 'package:diet_chaiyoo/view/Personalisation_Setup_view.dart';
import 'package:flutter/material.dart';
import 'package:diet_chaiyoo/view/Sigup_view.dart'; // Import SignUpView

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalisationSetup(), // Set SignUpView as the home screen
    );
  }
}