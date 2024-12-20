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
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title Label
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "ENTER YOUR AGE",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                  final selectedDate =
                      DateFormat('yyyy/MM/dd').format(dateTime);
                  // Navigating to Dashboard screen when NEXT is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Dashboard(selectedDate: selectedDate)),
                  );
                },
              ),
            ],
          ),
        ),
      );

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
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 42)),
        onPressed: onClicked,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.arrow_forward, size: 28), // Arrow icon for "Next"
            const SizedBox(width: 8),
            Text(
              text, // Display the "NEXT" text passed from the parent
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
}

// Dashboard screen that shows after clicking NEXT

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
