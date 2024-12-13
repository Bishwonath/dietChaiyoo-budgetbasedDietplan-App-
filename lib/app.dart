import 'package:diet_chaiyoo/view/Budget_Setup.dart';
import 'package:diet_chaiyoo/view/Dashboard.dart';
import 'package:diet_chaiyoo/view/User_setup_view.dart';
import 'package:diet_chaiyoo/view/select_package.dart';
import 'package:diet_chaiyoo/view/user_age_setup.dart';
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