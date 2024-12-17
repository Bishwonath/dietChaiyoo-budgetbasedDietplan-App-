import 'package:diet_chaiyoo/view/Budget_Setup_View.dart';
import 'package:diet_chaiyoo/view/Dashboard_View.dart';
import 'package:flutter/material.dart';

class UserAgeSetup extends StatefulWidget {
  const UserAgeSetup({Key? key}) : super(key: key);

  @override
  _UserAgeSetupState createState() => _UserAgeSetupState();
}

class _UserAgeSetupState extends State<UserAgeSetup> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;
  int index = 25; // Set default age value (for example, 25)

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.primaryDelta! > 0) {
        index = index > 1 ? index - 1 : index; // Prevent going below 1
      } else if (details.primaryDelta! < 0) {
        index = index < 99 ? index + 1 : index; // Prevent going above 99
      }
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Back Button (Top-Left)
            Positioned(
              top: 20.0,
              left: 20.0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BudgetSetup()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xff7d8592),
                  size: 30.0,
                ),
              ),
            ),
            // Title (Top-Center)
            Positioned(
              top: 20.0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "What's your age?",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Wheel Picker for Age
            Center(
              child: GestureDetector(
                onVerticalDragUpdate: _onDragUpdate, // Vertical drag detection
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _offsetAnimation.value * 50), // Vertical movement
                      child: Container(
                        height: 200.0, // Increased height to avoid clipping
                        width: 200.0, // Increased width to avoid clipping
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Previous Numbers
                            Positioned(
                              top: -30.0, // Increased distance for previous numbers
                              child: Opacity(
                                opacity: 0.5, // Slightly faded for the previous number
                                child: Text(
                                  '${index - 1}',
                                  style: const TextStyle(
                                    fontSize: 40.0, // Smaller than the main number
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -60.0, // Further up for a second previous number
                              child: Opacity(
                                opacity: 0.3, // Even more faded
                                child: Text(
                                  '${index - 2}',
                                  style: const TextStyle(
                                    fontSize: 30.0, // Further reduced font size
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // Current Number (centered and largest)
                            Text(
                              '$index',
                              style: const TextStyle(
                                fontSize: 60.0, // Larger font size for the center number
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Next Numbers
                            Positioned(
                              bottom: -30.0, // Increased distance for next numbers
                              child: Opacity(
                                opacity: 0.5, // Slightly faded for the next number
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 40.0, // Smaller than the main number
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -60.0, // Further down for a second next number
                              child: Opacity(
                                opacity: 0.3, // Even more faded
                                child: Text(
                                  '${index + 2}',
                                  style: const TextStyle(
                                    fontSize: 30.0, // Further reduced font size
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Next Button (Bottom-Right)
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 98, 9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
