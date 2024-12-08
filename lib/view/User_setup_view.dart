import 'package:flutter/material.dart';

class UserSetup extends StatefulWidget {
  const UserSetup({Key? key}) : super(key: key);

  @override
  _UserSetupState createState() => _UserSetupState();
}

class _UserSetupState extends State<UserSetup> {
  // Variables to store selected values
  String? selectedAge;
  String? selectedWeight;
  String? selectedHeight;

  // Dropdown items
  final List<String> ageOptions = List.generate(100, (index) => '${index + 1}'); // 1-100
  final List<String> weightOptions = List.generate(150, (index) => '${index + 30}'); // 30-180 kg
  final List<String> heightOptions = List.generate(140, (index) => '${index + 100}'); // 100-240 cm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Setup"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image taking 2:3 of the screen height
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                width: double.infinity, // Full width
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Placeholder background color
                  image: const DecorationImage(
                    image: AssetImage('assets/images/nayaphone.png'), // Replace with your image path
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Spacing after the image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Age Dropdown
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      value: selectedAge,
                      decoration: const InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(),
                      ),
                      items: ageOptions.map((age) {
                        return DropdownMenuItem<String>(
                          value: age,
                          child: Text(age),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedAge = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Space between fields

                  // Weight Dropdown
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      value: selectedWeight,
                      decoration: const InputDecoration(
                        labelText: "Weight (kg)",
                        border: OutlineInputBorder(),
                      ),
                      items: weightOptions.map((weight) {
                        return DropdownMenuItem<String>(
                          value: weight,
                          child: Text(weight),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedWeight = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Space between fields

                  // Height Dropdown
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      value: selectedHeight,
                      decoration: const InputDecoration(
                        labelText: "Height (cm)",
                        border: OutlineInputBorder(),
                      ),
                      items: heightOptions.map((height) {
                        return DropdownMenuItem<String>(
                          value: height,
                          child: Text(height),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedHeight = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Spacing at the bottom
          ],
        ),
      ),
    );
  }
}
