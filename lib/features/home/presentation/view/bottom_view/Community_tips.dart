import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  String healthGoal = 'Not set';
  String dietaryPreference = 'Not set';
  int age = 0;
  int weeklyBudget = 0;
  double height = 0;

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
    });
  }

  List<Map<String, String>> _getRecommendations() {
    List<Map<String, String>> recommendations = [];

    if (healthGoal == 'Lose Weight') {
      recommendations.addAll([
        {
          'title': '5 Simple Ways to Lose Weight',
          'content':
              'Eat smaller portions, stay active, and avoid processed foods.',
          'image': 'assets/images/weight_loss_tips.jpg',
        },
        {
          'title': 'Best Cardio Workouts for Fat Loss',
          'content':
              'Running, cycling, and HIIT workouts can help burn calories efficiently.',
          'image': 'assets/images/cardio.jpg',
        },
        {
          'title': 'Intermittent Fasting Explained',
          'content':
              'Fasting windows can help regulate calorie intake and improve metabolism.',
          'image': 'assets/images/fasting.jpeg',
        },
      ]);
    } else if (healthGoal == 'Gain Muscle') {
      recommendations.addAll([
        {
          'title': 'How to Build Muscle Effectively',
          'content':
              'Increase protein intake, lift heavier weights, and recover well.',
          'image': 'assets/images/muscle_gain.jpg',
        },
        {
          'title': 'Best Foods for Muscle Growth',
          'content':
              'Include chicken, eggs, and plant-based proteins for muscle repair.',
          'image': 'assets/images/muscle_foods.png',
        },
        {
          'title': 'Strength Training vs. Bodyweight Training',
          'content':
              'Lifting weights builds mass, while bodyweight exercises enhance endurance.',
          'image': 'assets/images/strength_training.webp',
        },
      ]);
    } else if (healthGoal == 'Stay Healthy') {
      recommendations.addAll([
        {
          'title': 'Daily Habits for a Healthier Lifestyle',
          'content':
              'Drink more water, eat fresh fruits, and reduce stress for well-being.',
          'image': 'assets/images/healthy_lifestyle.jpeg',
        },
        {
          'title': 'How Sleep Affects Your Health',
          'content':
              'Getting 7-9 hours of sleep is essential for mental and physical health.',
          'image': 'assets/images/sleep_health.jpg',
        },
        {
          'title': 'Mindfulness & Meditation for Stress Relief',
          'content':
              'Practicing meditation daily can improve focus and reduce anxiety.',
          'image': 'assets/images/meditation.jpg',
        },
      ]);
    }

    if (dietaryPreference == 'Vegetarian') {
      recommendations.addAll([
        {
          'title': 'Vegetarian Diet: What You Need to Know',
          'content': 'Get enough protein from lentils, chickpeas, and tofu.',
          'image': 'assets/images/vegetarian.webp',
        },
        {
          'title': 'Balanced Vegetarian Meal Plan',
          'content':
              'Mix vegetables, whole grains, and protein sources for a healthy diet.',
          'image': 'assets/images/vegetarian_meal.webp',
        },
      ]);
    } else if (dietaryPreference == 'Non-Vegetarian') {
      recommendations.addAll([
        {
          'title': 'Balanced Diet for Meat Lovers',
          'content':
              'Choose lean meats and pair them with vegetables for a healthy balance.',
          'image': 'assets/images/non_veg.jpeg',
        },
        {
          'title': 'Omega-3 Benefits from Fish',
          'content':
              'Fatty fish like salmon help boost brain function and heart health.',
          'image': 'assets/images/omega3.jpeg',
        },
      ]);
    }

    return recommendations;
  }

  void _showRecommendationDialog(Map<String, String> recommendation) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  recommendation['image']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      recommendation['content']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close', style: TextStyle(fontSize: 16)),
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
        title: const Text('Community Tips & Tricks'),
      ),
      body: recommendations.isEmpty
          ? const Center(child: Text('No recommendations available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      _showRecommendationDialog(recommendations[index]),
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
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recommendations[index]['title']!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                recommendations[index]['content']!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
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
