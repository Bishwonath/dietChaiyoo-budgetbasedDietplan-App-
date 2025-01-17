// import 'package:diet_chaiyoo/view/archive/Select_Packages_View.dart';
// import 'package:flutter/material.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   _SignUpViewState createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   bool rememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor:
//           theme.scaffoldBackgroundColor, // Use global background color
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 23.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFE07B39), // Primary color from theme
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Log in and get yourself the best diet",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: theme.textTheme.bodyLarge?.color
//                         ?.withOpacity(0.6), // Muted text color from theme
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 32),
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         const Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: "Email",
//                             hintText: "Enter your email",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             labelStyle: TextStyle(
//                               fontSize: 20,
//                               color: theme
//                                   .primaryColor, // Primary color from theme for labels
//                             ),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                         const SizedBox(height: 16),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             hintText: "Enter your password",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             labelStyle: TextStyle(
//                               fontSize: 20,
//                               color: theme
//                                   .primaryColor, // Primary color from theme for labels
//                             ),
//                           ),
//                           obscureText: true,
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Checkbox(
//                                   value: rememberMe,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       rememberMe = value ?? false;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Remember Me"),
//                               ],
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 // Navigate to password recovery page
//                               },
//                               child: Text(
//                                 "Forgot Password?",
//                                 style: TextStyle(
//                                   color: theme
//                                       .primaryColor, // Primary color from theme
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SelectPackages(),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 theme.primaryColor, // Primary color from theme
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 16.0),
//                             child: Text(
//                               "Login",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   "Don't have an account?",
//                   style: TextStyle(
//                       color: theme.textTheme.bodyLarge?.color
//                           ?.withOpacity(0.6)), // Muted text color from theme
//                 ),
//                 const SizedBox(height: 8),
//                 OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(
//                         color: theme
//                             .primaryColor), // Primary color from theme for border
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 12.0),
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                           color: Color(
//                               0xFFE07B39)), // Primary color from theme for text
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Divider(thickness: 1),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text(
//                         "Or continue with",
//                         style: TextStyle(
//                             color: theme.textTheme.bodyLarge?.color
//                                 ?.withOpacity(
//                                     0.6)), // Muted text color from theme
//                       ),
//                     ),
//                     const Expanded(
//                       child: Divider(thickness: 1),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // Facebook login action
//                       },
//                       icon: const Icon(Icons.facebook, color: Colors.blue),
//                       iconSize: 32,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         // Apple login action
//                       },
//                       icon: const Icon(Icons.apple, color: Colors.black),
//                       iconSize: 32,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
