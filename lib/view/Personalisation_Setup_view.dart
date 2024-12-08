import 'package:flutter/material.dart';

class PersonalisationSetup extends StatelessWidget {
  const PersonalisationSetup({Key? key}) : super(key: key);

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
              color: Colors.grey[300], // Placeholder background color
              image: const DecorationImage(
                image: AssetImage('assets/images/slighly thin.png'), // Replace with your image path
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
                  print('Button 1 Pressed');
                },
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Button 2 Pressed');
                },
                child: const Text('Continue'),
              ),
            ],
          ),
          const SizedBox(height: 20), // Add some space below the buttons
        ],
      ),
    );
  }
}
