import 'package:diet_chaiyoo/view/Dashboard_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Main user age setup screen
class UserAgeSetup extends StatefulWidget {
  const UserAgeSetup({super.key});

  @override
  _UserAgeSetupState createState() => _UserAgeSetupState();
}

class _UserAgeSetupState extends State<UserAgeSetup> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "ENTER YOUR AGE",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.headlineSmall
                      ?.color, // Use color from text theme
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            // Date Picker
            buildDatePicker(),
            const SizedBox(height: 24),

            // NEXT Button (updated ButtonWidget)
            ButtonWidget(
              text: "NEXT", // The text is now "NEXT"
              onClicked: () {
                // You can handle the selected date here
                final selectedDate = DateFormat('yyyy/MM/dd').format(dateTime);
                // Navigating to Dashboard screen when NEXT is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(selectedDate: selectedDate),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

// Custom button widget
class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;

  const ButtonWidget({
    super.key,
    required this.onClicked,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme
    final textTheme = theme.textTheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 42),
        backgroundColor:
            theme.colorScheme.secondary, // Secondary color from theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
      ),
      onPressed: onClicked,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.arrow_forward, size: 28), // Arrow icon for "Next"
          const SizedBox(width: 8),
          Text(
            text, // Display the "NEXT" text passed from the parent
            style: textTheme.labelLarge?.copyWith(
              color:
                  theme.scaffoldBackgroundColor, // Light beige color for text
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
