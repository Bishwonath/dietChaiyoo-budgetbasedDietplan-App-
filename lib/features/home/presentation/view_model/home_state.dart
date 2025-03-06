import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Community_tips.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Profile_view.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Restaurants_recommendations.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return const HomeState(
      selectedIndex: 0,
      views: [
        DashboardView(),
        Community(),
        RestaurantsRecommendations(),
        Profile(),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
