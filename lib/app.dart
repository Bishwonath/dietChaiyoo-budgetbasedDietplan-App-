import 'package:diet_chaiyoo/view/Budget_Setup_View.dart';
import 'package:diet_chaiyoo/view/Dashboard_View.dart';
import 'package:diet_chaiyoo/view/OnBoarding_View.dart';
import 'package:diet_chaiyoo/view/User_Setup_View.dart';
import 'package:diet_chaiyoo/view/Select_Packages_View.dart';
import 'package:diet_chaiyoo/view/User_Agesetup_View.dart';
import 'package:flutter/material.dart';
import 'package:diet_chaiyoo/view/Sigup_View.dart'; // Import SignUpView

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(), // Set SignUpView as the home screen
    );
  }
}