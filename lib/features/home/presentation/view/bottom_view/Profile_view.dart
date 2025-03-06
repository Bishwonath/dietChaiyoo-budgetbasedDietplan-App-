import 'package:diet_chaiyoo/core/app_theme/common/snackbar/my_snackbar.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view/user_preference_view.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo Image
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Make sure logo.png is placed in your assets
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 24),

            // User Information Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Health Goal Preference in Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Health Goal: $healthGoal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Dietary Preference in Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Dietary Preference: $dietaryPreference',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Age in Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Age: $age',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Height in Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Height: $height',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Weekly Budget in Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Weekly Budget: $weeklyBudget',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Edit Preferences Button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // Make button longer
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: GetIt.I<UserPreferencesBloc>(),
                          child: UserPreferencesPage(
                              userId: ''), // Pass userId as needed
                        ),
                      ),
                    );
                    if (result == true) {
                      _loadPreferences(); // Reload data when returning
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Edit Preferences',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Log Out Button
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // Make button longer
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    padding: const EdgeInsets.symmetric(
                        vertical: 14), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Show the logout message in a SnackBar
                    showMySnackBar(
                      context: context,
                      message: 'Logging Out.',
                      color: Colors.red,
                    );
                    // Call logout from HomeCubit (you can adjust this based on your specific logic)
                    context.read<HomeCubit>().logout(context);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
