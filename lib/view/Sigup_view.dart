import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
               ElevatedButton.icon(
              onPressed: () {
                // Handle Google Sign-Up logic here
                print('Google Sign-Up button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign Up with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 86, 54, 244),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                
              ),
              
            ),
            // Email Text Field
             SizedBox(height: 16),
            

            // Google Sign-Up Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google Sign-Up logic here
                print('Google Sign-Up button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign Up with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
             SizedBox(height: 100),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
              TextField(
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
             ElevatedButton.icon(
              onPressed: () {
                // Handle Google Sign-Up logic here
                print('Google Sign-Up button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 229, 218, 218),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
