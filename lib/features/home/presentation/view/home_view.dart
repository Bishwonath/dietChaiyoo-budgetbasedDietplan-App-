import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diet_chaiyoo/core/app_theme/common/snackbar/my_snackbar.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Color(0xFFF2F3DA), // Use a legacy color directly here
        ),
        title: const Text(
          'Your Diet Planner',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              showMySnackBar(
                context: context,
                message: 'Logging Out.',
                color: Colors.red,
              );
              context.read<HomeCubit>().logout(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.views.elementAt(state.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: const Color.fromARGB(255, 255, 255, 255),
            buttonBackgroundColor: Colors.white,
            height: 60,
            animationDuration: const Duration(milliseconds: 200),
            index: state.selectedIndex,
            items: const [
              Icon(Icons.home, size: 30, color: Colors.black),
              Icon(Icons.line_weight, size: 30, color: Colors.black),
              Icon(Icons.wine_bar, size: 30, color: Colors.black),
              Icon(Icons.person, size: 30, color: Colors.black),
            ],
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}
