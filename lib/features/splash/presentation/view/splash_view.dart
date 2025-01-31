import 'package:diet_chaiyoo/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<SplashCubit>().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3DA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding1.png',
              height: 500,
            ),
            const SizedBox(height: 20),
            Text(
              'Personalized Meal Ideas',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Get tailored meal suggestions based on your preferences and budget.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 132, 135, 138),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
