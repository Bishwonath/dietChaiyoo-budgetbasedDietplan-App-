import 'package:diet_chaiyoo/view/Select_Packages_View.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // Use global background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // Logo
                  Icon(
                    Icons.lock,
                    size: 80,
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Use primary color
                  ),

                  const SizedBox(height: 20),

                  // Username text field
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // Password text field
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  // Sign in button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectPackages(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary, // Set a contrasting color for text
                              ),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary, // Primary color for button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Sign In"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.surface), // Use surface color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.primary), // Use primary color
        ),
        fillColor: Theme.of(context).colorScheme.surface, // Use surface color
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface, // Use onSurface color
            ),
      ),
    );
  }
}
