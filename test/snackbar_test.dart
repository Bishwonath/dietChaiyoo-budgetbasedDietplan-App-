import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diet_chaiyoo/core/app_theme/common/snackbar/my_snackbar.dart';

void main() {
  testWidgets('showMySnackBar displays a SnackBar with correct message and color',
      (WidgetTester tester) async {
    const testMessage = 'Test SnackBar Message';
    const testColor = Colors.red;

    // Create a test widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showMySnackBar(
                context: context,
                message: testMessage,
                color: testColor,
              ),
              child: const Text('Show SnackBar'),
            ),
          ),
        ),
      ),
    );

    // Tap the button to trigger the SnackBar
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Start the SnackBar animation
    await tester.pump(const Duration(seconds: 1)); // Wait for SnackBar to appear

    // Verify the SnackBar message
    expect(find.text(testMessage), findsOneWidget);

    // Verify the SnackBar's background color
    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, testColor);
  });
}
