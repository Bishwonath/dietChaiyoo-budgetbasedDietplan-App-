import 'package:diet_chaiyoo/view/Sigup_View.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personalisation Setup"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image taking 2:3 of the screen height
          Container(
            height: screenHeight * (2 / 3), // 2:3 of the screen height
            width: double.infinity, // Full width
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255), // Placeholder background color
              image: const DecorationImage(
                image: AssetImage('assets/images/diet cahiyoo logo.png'), // Replace with your image path
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
          ),
          const Spacer(), // Push buttons to the bottom
          // Row with two buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpView()),
    );
                },
                child: const Text('Logout'),
              ),
            
            ],
          ),
          const SizedBox(height: 20), // Add some space below the buttons
        ],
      ),
    );
  }
}
