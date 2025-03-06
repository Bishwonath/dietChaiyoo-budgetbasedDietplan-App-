import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userPreferences_api_model.g.dart';

@JsonSerializable()
class UserPreferencesApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String healthGoal;
  final String dietaryPreference;
  final int weeklyBudget;
  final int age;
  final double weight;
  final double height;

  const UserPreferencesApiModel({
    this.id,
    required this.healthGoal,
    required this.dietaryPreference,
    required this.weeklyBudget,
    required this.age,
    required this.weight,
    required this.height,
  });

  // From JSON
  factory UserPreferencesApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$UserPreferencesApiModelToJson(this);

  // Convert API Object to Entity
  UserPreferencesEntity toEntity() => UserPreferencesEntity(
        id: id,
        healthGoal: healthGoal,
        dietaryPreference: dietaryPreference,
        weeklyBudget: weeklyBudget,
        age: age,
        weight: weight,
        height: height,
      );

  // Convert API List to Entity List
  static List<UserPreferencesEntity> toEntityList(
          List<UserPreferencesApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [id, healthGoal, dietaryPreference, weeklyBudget, age, weight, height];
}
