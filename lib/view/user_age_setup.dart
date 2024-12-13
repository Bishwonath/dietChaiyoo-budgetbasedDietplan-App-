import 'package:diet_chaiyoo/view/Budget_Setup.dart';
import 'package:diet_chaiyoo/view/Dashboard.dart';
import 'package:flutter/material.dart';

class UserAgeSetup extends StatefulWidget {
  const UserAgeSetup({Key? key}) : super(key: key);

  @override
  _UserAgeSetupState createState() => _UserAgeSetupState();
}

class _UserAgeSetupState extends State<UserAgeSetup> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;
  int index = 1;

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
      if (details.delta.dy > 0) {
        index = index > 1 ? index - 1 : index; // Prevent going below 1
      } else if (details.delta.dy < 0) {
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
                
                   // Handle back button press
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xff7d8592),
                  size: 30.0,
                ),
              ),
            ),
            // Centered Age Selector
            Center(
              child: GestureDetector(
                onVerticalDragUpdate: _onDragUpdate, // Vertical drag detection
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _offsetAnimation.value * 50), // Vertical movement
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 187, 33),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(131, 15, 125, 9),
                              offset: const Offset(0.0, 15.0),
                              blurRadius: 20.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '$index',
                            style: const TextStyle(
                              fontSize: 43.0,
                              color: Colors.white,
                            ),
                          ),
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
    );// Handle next button press
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
