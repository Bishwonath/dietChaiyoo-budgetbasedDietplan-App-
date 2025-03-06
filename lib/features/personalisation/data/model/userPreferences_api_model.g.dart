// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userPreferences_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesApiModel _$UserPreferencesApiModelFromJson(
        Map<String, dynamic> json) =>
    UserPreferencesApiModel(
      id: json['_id'] as String?,
      healthGoal: json['healthGoal'] as String,
      dietaryPreference: json['dietaryPreference'] as String,
      weeklyBudget: (json['weeklyBudget'] as num).toInt(),
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$UserPreferencesApiModelToJson(
        UserPreferencesApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'healthGoal': instance.healthGoal,
      'dietaryPreference': instance.dietaryPreference,
      'weeklyBudget': instance.weeklyBudget,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
    };
