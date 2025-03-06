import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String healthGoal = 'Not set';
  String dietaryPreference = 'Not set';
  int age = 0;
  double height = 0;
  int weeklyBudget = 0;

  // Load preferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      healthGoal = prefs.getString('healthGoal') ?? 'Not set';
      dietaryPreference = prefs.getString('dietaryPreference') ?? 'Not set';
      age = prefs.getInt('age') ?? 0;
      weeklyBudget = prefs.getInt('weeklyBudget') ?? 0;
      height = prefs.getDouble('height') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Navigation logic based on title
  void _navigateBasedOnSelection(String title) {
    if (title == 'Health Goal: Not set' ||
        title.contains('Stay') ||
        title.contains('Lose') ||
        title.contains('Goal')) {
      // Navigate to the community view (index 1 is Community)
      context.read<HomeCubit>().onTabTapped(1); // Community view index
    } else if (title.contains('Diet')) {
      // Navigate to the restaurant recommendation view (index 2 is Restaurant)
      context.read<HomeCubit>().onTabTapped(2); // Restaurant view index
    }
  }

  @override
  Widget build(BuildContext context) {
    String imageAsset = '';
    String title = '';

    // You can adjust the logic here based on your actual health goal
    if (healthGoal == 'Lose Weight') {
      imageAsset = 'assets/images/loseweight.png';
      title = 'Weight Loss Goal';
    } else if (healthGoal == 'Gain Muscle') {
      imageAsset = 'assets/images/gainweight.png';
      title = 'Muscle Gain Goal';
    } else if (healthGoal == 'Stay Healthy') {
      imageAsset = 'assets/images/stayhealthy.png';
      title = 'Stay Healthy & Fit';
    } else {
      imageAsset =
          'assets/images/default_goal.jpg'; // Default image if health goal is not set
      title = 'Health Goal: Not set';
    }
    String dietBudgetImage = '';
    String dietBudgetTitle = '';

    if (dietaryPreference == 'Vegetarian') {
      dietBudgetImage = 'assets/images/onboarding1.png';
      dietBudgetTitle = 'Vegetarian Diet';
    } else if (dietaryPreference == 'Non-Vegetarian') {
      dietBudgetImage = 'assets/images/onboarding2.png';
      dietBudgetTitle = 'Non-Vegetarian Diet';
    } else if (dietaryPreference == 'Vegan') {
      dietBudgetImage = 'assets/images/onboarding3.png';
      dietBudgetTitle = 'Vegan Diet';
    }

    // Adjust the image based on the weekly budget (100 to 5000)
    if (weeklyBudget >= 100 && weeklyBudget <= 1000) {
      dietBudgetImage =
          'assets/images/onboarding1.png'; // Low budget (100 - 1000)
      dietBudgetTitle += ' (Low Budget)';
    } else if (weeklyBudget > 1000 && weeklyBudget <= 3000) {
      dietBudgetImage = 'assets/images/11.jpg'; // Medium budget (1001 - 3000)
      dietBudgetTitle += ' (Medium Budget)';
    } else if (weeklyBudget > 3000 && weeklyBudget <= 5000) {
      dietBudgetImage =
          'assets/images/onboarding3.png'; // High budget (3001 - 5000)
      dietBudgetTitle += ' (High Budget)';
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/logo.png', // Replace with your logo asset path
                          height: 100, // Adjust the size as needed
                          width: 100, // Adjust the size as needed
                          fit: BoxFit
                              .contain, // Maintain aspect ratio of the logo
                        ),
                      ),
                      const SizedBox(height: 0),
                      // Highlighted text with the label
                      Container(
                        width: double
                            .infinity, // Make the container span the full width
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0), // Add padding for spacing
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 220,
                              117), // Set the label background color to #CBE198
                          // Optional: Rounded corners
                        ),
                        child: const Text(
                          "Best Way to Learn About Diets ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color should be white
                          ),
                          textAlign: TextAlign
                              .center, // Move textAlign here to the Text widget
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    crossAxisSpacing: 10, // Adjust spacing between columns
                    mainAxisSpacing: 10, // Adjust spacing between rows
                    children: [
                      
                      PlaceCard(
                        image: imageAsset,
                        title: title,
                        onButtonPressed: () => _navigateBasedOnSelection(title),
                      ), // Pass the callback
                      PlaceCard(
                        image: dietBudgetImage,
                        title: dietBudgetTitle,
                        onButtonPressed: () =>
                            _navigateBasedOnSelection(dietBudgetTitle),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Space between content
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onButtonPressed;
  const PlaceCard({
    super.key,
    required this.image,
    required this.title,
    required this.onButtonPressed, // Initialize the callback
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.scaleDown, // Ensures the image covers the container
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(103, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Get the Best Recommendation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
