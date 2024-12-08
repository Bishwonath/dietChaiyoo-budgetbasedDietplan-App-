import 'package:flutter/material.dart';
import 'package:diet_chaiyoo/view/Sigup_view.dart'; // Import SignUpView

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpView(), // Set SignUpView as the home screen
    );
  }
}
