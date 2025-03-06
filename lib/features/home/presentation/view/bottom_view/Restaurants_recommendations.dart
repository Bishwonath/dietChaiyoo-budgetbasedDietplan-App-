import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantsRecommendations extends StatefulWidget {
  const RestaurantsRecommendations({super.key});

  @override
  _RestaurantsRecommendationsState createState() =>
      _RestaurantsRecommendationsState();
}

class _RestaurantsRecommendationsState
    extends State<RestaurantsRecommendations> {
  String healthGoal = 'Not set';
  String dietaryPreference = 'Not set';
  int age = 0;
  int weeklyBudget = 0;
  double height = 0;
  String dietBudgetImage = '';
  String dietBudgetTitle = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      healthGoal = prefs.getString('healthGoal') ?? 'Not set';
      dietaryPreference = prefs.getString('dietaryPreference') ?? 'Not set';
      age = prefs.getInt('age') ?? 0;
      weeklyBudget = prefs.getInt('weeklyBudget') ?? 0;
      height = prefs.getDouble('height') ?? 0;
      _updateDietAndBudgetDetails();
    });
  }

  void _updateDietAndBudgetDetails() {
    if (dietaryPreference == 'Vegetarian') {
      dietBudgetImage = 'assets/images/vegetarian.jpg';
      dietBudgetTitle = 'Vegetarian Diet';
    } else if (dietaryPreference == 'Non-Vegetarian') {
      dietBudgetImage = 'assets/images/non_veg.jpg';
      dietBudgetTitle = 'Non-Vegetarian Diet';
    } else if (dietaryPreference == 'Vegan') {
      dietBudgetImage = 'assets/images/vegan.jpg';
      dietBudgetTitle = 'Vegan Diet';
    }

    // Adjust the image based on the weekly budget (100 to 5000)
    if (weeklyBudget >= 100 && weeklyBudget <= 1000) {
      dietBudgetImage = 'assets/images/low_budget.jpg'; // Low budget
      dietBudgetTitle += ' (Low Budget)';
    } else if (weeklyBudget > 1000 && weeklyBudget <= 3000) {
      dietBudgetImage = 'assets/images/medium_budget.jpg'; // Medium budget
      dietBudgetTitle += ' (Medium Budget)';
    } else if (weeklyBudget > 3000 && weeklyBudget <= 5000) {
      dietBudgetImage = 'assets/images/high_budget.jpg'; // High budget
      dietBudgetTitle += ' (High Budget)';
    }
  }

  List<Map<String, String>> _getRecommendations() {
    List<Map<String, String>> recommendations = [];

    if (dietaryPreference == 'Vegetarian') {
      recommendations.addAll([
        {
          'title': 'Vegetarian Delight',
          'content':
              'A perfect place for vegetarian dishes, offering fresh salads, veggie burgers, and plant-based pastas.',
          'image': 'assets/images/vegetarian_restaurant.webp',
          'location': '977 Veggie Street, Green Town',
          'phone': '+977 456 7890',
          'url': 'https://www.vegetariandelight.com',
          'healthGoal': 'Weight Loss',
        },
        {
          'title': 'Green Garden Café',
          'content':
              'Vibrant vegan-friendly café with organic ingredients and refreshing smoothies.',
          'image': 'assets/images/green_garden.jpeg',
          'location': '456 Garden Road, Sunnyvale',
          'phone': '+977 987 6543',
          'url': 'https://www.greengardencafe.com',
          'healthGoal': 'Muscle Gain',
        },
        {
          'title': 'Pure Greens',
          'content':
              'A 100% vegan restaurant serving fresh plant-based dishes.',
          'image': 'assets/images/pure_greens.jpeg',
          'location': '321 Vegan Road, Green City',
          'phone': '+977 555 6666',
          'url': 'https://www.puregreens.com',
          'healthGoal': 'Weight Loss',
        },
      ]);
    } else if (dietaryPreference == 'Non-Vegetarian') {
      recommendations.addAll([
        {
          'title': 'Carnivore’s Grill',
          'content':
              'A top pick for non-vegetarians, featuring grilled meats and hearty sides.',
          'image': 'assets/images/carnivore_grill.jpg',
          'location': '789 Meat Avenue, City Center',
          'phone': '+977 111 2222',
          'url': 'https://www.carnivoresgrill.com',
          'healthGoal': 'Muscle Gain',
        },
        {
          'title': 'Fish & Chips Co.',
          'content':
              'Enjoy fresh fish and chips with a variety of sauces and sides.',
          'image': 'assets/images/fish_chips.jpg',
          'location': '101 Ocean Drive, Seaside',
          'phone': '+977 333 4444',
          'url': 'https://www.fishandchipsco.com',
          'healthGoal': 'Weight Loss',
        },
      ]);
    }

    // Filter recommendations based on health goal (Weight Loss or Muscle Gain)
    if (healthGoal == 'Weight Loss') {
      recommendations = recommendations
          .where((rec) => rec['healthGoal'] == 'Weight Loss')
          .toList();
    } else if (healthGoal == 'Muscle Gain') {
      recommendations = recommendations
          .where((rec) => rec['healthGoal'] == 'Muscle Gain')
          .toList();
    }

    return recommendations;
  }

  // Method to launch the URL
  // Future<void> _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Show the modal bottom sheet with restaurant details
  void _showRestaurantDetails(Map<String, String> restaurant) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Make sure the sheet can adjust to the content height
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Restaurant image with responsive design
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  restaurant['image']!,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.3, // Adjust based on screen height
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              // Restaurant title and description
              Text(
                restaurant['title']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.color, // For better theme support
                ),
              ),
              const SizedBox(height: 8),
              Text(
                restaurant['content']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color, // Responsive text color
                ),
              ),
              const SizedBox(height: 16),
              // Location and phone number
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8),
                  Expanded(
                    // To ensure that long locations don't overflow
                    child: Text(
                      restaurant['location']!,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis, // Handles long text
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      restaurant['phone']!,
                      style: TextStyle(fontSize: 16),
                      overflow:
                          TextOverflow.ellipsis, // Handles long phone numbers
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Button to visit the website
              ElevatedButton(
                onPressed: () {
                  // _launchURL(restaurant['url']!);
                },
                child: const Text('Visit Website'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14), // Adding padding for better touch target
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded button
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> recommendations = _getRecommendations();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Recommendations'),
      ),
      body: recommendations.isEmpty
          ? const Center(child: Text('No recommendations available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showRestaurantDetails(recommendations[index]);
                  },
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.asset(
                            recommendations[index]['image']!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            recommendations[index]['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
