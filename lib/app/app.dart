import 'package:diet_chaiyoo/app/di/di.dart';
import 'package:diet_chaiyoo/core/theme/app_theme.dart';
import 'package:diet_chaiyoo/features/splash/presentation/view/splash_view.dart';
import 'package:diet_chaiyoo/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diet Chaiyoo',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
