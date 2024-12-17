import 'package:diet_chaiyoo/view/Select_Packages_View.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Space for logo
            Center(
              child: Image.asset(
                'assets/images/diet cahiyoo logo.png', // Path to your logo image
                height: 200.0, // Adjust height to your preference
              ),
            ),
            

            ElevatedButton.icon(
              onPressed: () {
                // Handle Google Sign-Up logic here
                print('Google Sign-Up button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign Up with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                foregroundColor: const Color.fromARGB(255, 73, 140, 255),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 5),

            ElevatedButton.icon(
              onPressed: () {
                // Handle Google Sign-Up logic here
                print('Google Sign-Up button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign Up with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 25),

            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              
              ),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // Handle login logic here
                print('Login button pressed');
              },
              icon: Icon(Icons.account_circle),
              label: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 9, 131, 15),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // Navigate to SelectPackages screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectPackages()),
                );
              },
              icon: Icon(Icons.arrow_forward),
              label: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 224, 123, 7),
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
