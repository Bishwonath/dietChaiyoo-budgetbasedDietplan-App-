import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Color(0xFFDCE3CD),
            buttonBackgroundColor: Colors.white,
            height: 60,
            animationDuration: const Duration(milliseconds: 300),
            index: state.selectedIndex,
            items: const [
              Icon(Icons.home, size: 30, color: Colors.black),
              Icon(Icons.group, size: 30, color: Colors.black),
              Icon(Icons.restaurant, size: 30, color: Colors.black),
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
