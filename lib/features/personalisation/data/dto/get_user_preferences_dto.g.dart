// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_preferences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
GetUserPreferencesDTO _$GetUserPreferencesDTOFromJson(
        Map<String, dynamic> json) =>
    GetUserPreferencesDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              UserPreferencesApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserPreferencesDTOToJson(
        GetUserPreferencesDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };