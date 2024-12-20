import 'package:diet_chaiyoo/view/Bottom_Navigation.dart/about.dart';
import 'package:diet_chaiyoo/view/Bottom_Navigation.dart/cart.dart';
import 'package:diet_chaiyoo/view/Bottom_Navigation.dart/home.dart';
import 'package:diet_chaiyoo/view/Bottom_Navigation.dart/profile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required String selectedDate});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Current index for BottomNavigationBar
  int _selectedIndex = 0;

  // List of Screens
  final List<Widget> lstBottomScreen = [
    const HomePage(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('diet chaiyoo'),
        centerTitle: true,
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
