import 'package:diet_chaiyoo/app/di/di.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/home_view.dart'; // Import HomeView
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart'; // Import HomeCubit
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart'; // Import the entity class
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_bloc.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_event.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesPage extends StatefulWidget {
  final String userId;

  const UserPreferencesPage({required this.userId, Key? key}) : super(key: key);

  @override
  _UserPreferencesPageState createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  final _formKey = GlobalKey<FormState>();
  String healthGoal = '';
  String dietaryPreference = '';
  int weeklyBudget = 5000;
  int age = 25;
  double weight = 70.0;
  double height = 170.0;

  final List<String> healthGoals = [
    'Lose Weight',
    'Stay Healthy',
    'Gain Muscle'
  ];
  final List<String> dietaryPreferences = [
    'Vegetarian',
    'Non-Vegetarian',
  ];

  final PageController _pageController = PageController();
  int currentPage = 0;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      healthGoal = prefs.getString('healthGoal') ?? '';
      dietaryPreference = prefs.getString('dietaryPreference') ?? '';
      age = prefs.getInt('age') ?? 25;
      weeklyBudget = prefs.getInt('weeklyBudget') ?? 5000;
      height = prefs.getDouble('height') ?? 155;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('healthGoal', healthGoal);
    await prefs.setString('dietaryPreference', dietaryPreference);
    await prefs.setInt('weeklyBudget', weeklyBudget);
    await prefs.setInt('age', age);
    await prefs.setDouble('weight', weight);
    await prefs.setDouble('height', height);
  }

  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
      ),
      backgroundColor:
          Color(0xFFF2F3DA), // Set the background color for the entire screen
      body: Builder(
        builder: (context) {
          return BlocListener<UserPreferencesBloc, UserPreferencesState>(
            listener: (context, state) {
              if (state is UserPreferencesFailure) {
                ScaffoldMessenger.of(context)..hideCurrentSnackBar();
              } else if (state is UserPreferencesUpdatedSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Preferences updated successfully!')));
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PageView with swipeable cards
                    SizedBox(
                      height: 500, // Adjust as needed
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        children: [
                          // Health Goal Card
                          _buildHealthGoalCard(),
                          // Dietary Preference Card
                          _buildDietaryPreferenceCard(),
                          // Age, Weight, and Height Card
                          _buildAgeWeightHeightCard(),
                          // Budget Card
                          _buildBudgetCard(),
                        ],
                      ),
                    ),
                    // Navigation buttons
                    _buildNavigationButtons(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Health Goal Card
  Widget _buildHealthGoalCard() {
    return Container(
      color: Color(0xFFF2F3DA), // Set background color for the card
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add image at the top of the card
          Image.asset('assets/images/onboarding1.png', width: double.infinity),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: healthGoal.isEmpty ? null : healthGoal,
            onChanged: (newValue) {
              setState(() {
                healthGoal = newValue!;
              });
            },
            items: healthGoals
                .map((goal) => DropdownMenuItem<String>(
                      value: goal,
                      child: Text(goal),
                    ))
                .toList(),
            decoration: InputDecoration(
              labelText: 'Health Goal',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a health goal';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Dietary Preference Card
  Widget _buildDietaryPreferenceCard() {
    return Container(
      color: Color(0xFFF2F3DA), // Set background color for the card
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add image at the top of the card
          Image.asset('assets/images/onboarding2.png', width: double.infinity),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: dietaryPreference.isEmpty ? null : dietaryPreference,
            onChanged: (newValue) {
              setState(() {
                dietaryPreference = newValue!;
              });
            },
            items: dietaryPreferences
                .map((preference) => DropdownMenuItem<String>(
                      value: preference,
                      child: Text(preference),
                    ))
                .toList(),
            decoration: InputDecoration(
              labelText: 'Dietary Preference',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a dietary preference';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Age, Weight, and Height Card
  Widget _buildAgeWeightHeightCard() {
    return Container(
      color: Color(0xFFF2F3DA), // Set background color for the card
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add image at the top of the card
          Image.asset('assets/images/stayhealthy.png', width: double.infinity),
          SizedBox(height: 16),
          // Age Field
          TextFormField(
            initialValue: age.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                age = int.tryParse(value) ?? 25;
              });
            },
            decoration: InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          // Weight Field
          TextFormField(
            initialValue: weight.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                weight = double.tryParse(value) ?? 70.0;
              });
            },
            decoration: InputDecoration(
              labelText: 'Weight (kg)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          // Height Field
          TextFormField(
            initialValue: height.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                height = double.tryParse(value) ?? 170.0;
              });
            },
            decoration: InputDecoration(
              labelText: 'Height (cm)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Weekly Budget Card
  Widget _buildBudgetCard() {
    return Container(
      color: Color(0xFFF2F3DA), // Set background color for the card
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add logo image at the top of the card
          Image.asset('assets/images/logo.png', width: double.infinity),
          SizedBox(height: 16),
          Slider(
            value: weeklyBudget.toDouble(),
            min: 100,
            max: 5000,
            divisions: 50,
            label: '\₹${weeklyBudget.round()}',
            onChanged: (value) {
              setState(() {
                weeklyBudget = value.toInt();
              });
            },
          ),
          Text('Weekly Budget: \₹${weeklyBudget.round()}'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Navigation buttons (Next, Previous, Save)
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentPage > 0)
          ElevatedButton(
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Previous'),
          ),
        if (currentPage < 3)
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Next'),
          ),
        if (currentPage == 3)
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _savePreferences();
                final userPreferences = UserPreferencesEntity(
                  healthGoal: healthGoal,
                  dietaryPreference: dietaryPreference,
                  weeklyBudget: weeklyBudget,
                  age: age,
                  weight: weight,
                  height: height,
                );

                context.read<UserPreferencesBloc>().add(
                      UpdateUserPreferencesEvent(
                        userId: widget.userId,
                        userPreferences: userPreferences,
                      ),
                    );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => getIt<HomeCubit>(),
                      child: HomeView(),
                    ),
                  ),
                );
              }
            },
            child: Text('Save Preferences'),
          ),
      ],
    );
  }
}
