import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Community_tips.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Profile_view.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/Restaurants_recommendations.dart';
import 'package:diet_chaiyoo/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeState Tests', () {
    test('initial state should have correct default values', () {
      final state = HomeState.initial();

      expect(state.selectedIndex, 0);
      expect(state.views.length, 4);
      expect(state.views[0], isA<DashboardView>());
      expect(state.views[1], isA<Community>());
      expect(state.views[2], isA<RestaurantsRecommendations>());
      expect(state.views[3], isA<Profile>());
    });

    test('copyWith should update selectedIndex correctly', () {
      final state = HomeState.initial();
      final newState = state.copyWith(selectedIndex: 2);

      expect(newState.selectedIndex, 2);
      expect(newState.views, state.views); // Views should remain the same
    });

    test('copyWith should update views correctly', () {
      final state = HomeState.initial();
      final newViews = [Container(), Container(), Container(), Container()];
      final newState = state.copyWith(views: newViews);

      expect(newState.selectedIndex, state.selectedIndex); // Index remains same
      expect(newState.views, newViews);
    });

    test('equatable should properly compare states', () {
      final state1 = HomeState.initial();
      final state2 = HomeState.initial();
      final modifiedState = state1.copyWith(selectedIndex: 1);

      expect(state1, state2); // Same values -> should be equal
      expect(state1 == modifiedState, false); // Different index -> not equal
    });
  });
}
