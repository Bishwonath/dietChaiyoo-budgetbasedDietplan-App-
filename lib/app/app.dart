import 'package:diet_chaiyoo/app/di/di.dart';
import 'package:diet_chaiyoo/core/theme/app_theme.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view/login_view.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(
        value:getIt<LoginBloc>(),
        child: LoginView(), 
      ),


      theme: getApplicationTheme(),
    );
  }
}
