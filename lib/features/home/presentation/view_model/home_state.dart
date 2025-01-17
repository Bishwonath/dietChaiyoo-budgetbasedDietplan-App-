import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:diet_chaiyoo/features/user_profile/presentation/view/profile_view.dart';
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
    return HomeState(
      selectedIndex: 0,
      views: [
        const DashBoardView(),
        // DiscoverView(),
        // ForumView(),
        const ProfileView(),

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
