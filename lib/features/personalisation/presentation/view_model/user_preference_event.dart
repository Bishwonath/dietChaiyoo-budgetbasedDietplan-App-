import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserPreferencesEvent extends Equatable {
  const UserPreferencesEvent();
  @override
  List<Object> get props => [];
}

class UpdateUserPreferencesEvent extends UserPreferencesEvent {
  final String userId;
  final UserPreferencesEntity userPreferences;

  UpdateUserPreferencesEvent({
    required this.userId,
    required this.userPreferences,
  });

  @override
  // TODO: implement props
  List<Object> get props => [userId, userPreferences];
}

// class UpdateUserPreferencesEvent extends UserPreferencesEvent {
//   final String userId;
//   final String healthGoal;
//   final String dietaryPreference;
//   final double weeklyBudget;
//   final int age;
//   final double weight;
//   final double height;

//   const UpdateUserPreferencesEvent({
//     required this.userId,
//     required this.healthGoal,
//     required this.dietaryPreference,
//     required this.weeklyBudget,
//     required this.age,
//     required this.weight,
//     required this.height,
//   });

//   @override
//   List<Object?> get props => [
//         userId,
//         healthGoal,
//         dietaryPreference,
//         weeklyBudget,
//         age,
//         weight,
//         height,
//       ];
// }
