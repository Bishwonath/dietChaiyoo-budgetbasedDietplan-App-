import 'package:equatable/equatable.dart';

class UserPreferencesEntity extends Equatable {
  final String? id;
  final String healthGoal;
  final String dietaryPreference;
  final int weeklyBudget;
  final int age;
  final double weight;
  final double height;

  UserPreferencesEntity({
    this.id,
    required this.healthGoal,
    required this.dietaryPreference,
    required this.weeklyBudget,
    required this.age,
    required this.weight,
    required this.height,
  });
  // Convert Entity to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'healthGoal': healthGoal,
      'dietaryPreference': dietaryPreference,
      'weeklyBudget': weeklyBudget,
      'age': age,
      'weight': weight,
      'height': height,
    };
  }

  @override
  List<Object?> get props =>
      [id, healthGoal, dietaryPreference, weeklyBudget, age, weight, height];
}
