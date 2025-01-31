import 'package:diet_chaiyoo/features/auth/presentation/view/register_view.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _gap = const SizedBox(height: 16);

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 255, 255, 255), // Matches the gradient color
        elevation: 0, // Removes shadow for a clean look
        toolbarHeight: 0, // Hides the toolbar to only color the top area
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Linear Gradient for travel theme
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromARGB(255, 177, 255, 143),
                    //     Color.fromARGB(255, 255, 255, 255)
                    //   ],
                    //   begin: Alignment.bottomLeft,
                    //   end: Alignment.topCenter,
                    // ),
                    ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Section.
                      Image.asset(
                        'assets/images/logo.png',
                        width: 300,
                        height: 280,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 0),
                      // Welcome Message
                      const Text(
                        'Diet chaiyoo',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // const Text(
                      //   'From Far to Near, Your Guide is Here',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.white70,
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      // Username Label
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Username Field
                      TextFormField(
                        key: const ValueKey('username'),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(16),
                          // ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      // Password Label
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Password Field with Visibility Toggle
                      StatefulBuilder(
                        builder: (context, setState) {
                          bool isPasswordVisible = false;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                key: const ValueKey('password'),
                                controller: _passwordController,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.9),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(16),
                                  // ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                }),
                              ),
                              const SizedBox(height: 1),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // Add Forgot Password Logic Here
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 64, 64, 64),
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      // Login Button with Travel Feel
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginUserEvent(
                                context: context,
                                username: _usernameController.text,
                                password: _passwordController.text));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 155, 29),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 64),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),
                      // Register Button with Travel Theme
                      TextButton(
                        key: const ValueKey('registerButton'),
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                NavigateRegisterScreenEvent(
                                  destination: const RegisterView(),
                                  context: context,
                                ),
                              );
                        },
                        child: const Text(
                          'Don’t have an account? Register',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
