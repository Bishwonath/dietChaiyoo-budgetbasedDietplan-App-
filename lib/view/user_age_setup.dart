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
      if (details.delta.dx > 0) {
        index++;
      } else if (details.delta.dx < 0) {
        index--;
      }
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: _onDragUpdate,
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_offsetAnimation.value * 50, 0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade300,
                          offset: const Offset(0.0, 15.0),
                          blurRadius: 20.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(fontSize: 43.0, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
