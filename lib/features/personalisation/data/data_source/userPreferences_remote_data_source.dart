import 'dart:convert';
import 'package:diet_chaiyoo/app/constants/api_endpoints.dart';
import 'package:diet_chaiyoo/app/shared_prefs/token_shared_prefs.dart';
import 'package:diet_chaiyoo/features/personalisation/data/model/userPreferences_api_model.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:dio/dio.dart';

class UserPreferencesRemoteDataSource {
  final Dio _dio;
  final TokenSharedPrefs _tokenSharedPrefs;

  UserPreferencesRemoteDataSource({
    required Dio dio,
    required TokenSharedPrefs tokenSharedPrefs,
  })  : _dio = dio,
        _tokenSharedPrefs = tokenSharedPrefs;

  // Fetch user preferences
  Future<UserPreferencesEntity> getUserPreferences(String userId) async {
    try {
      var response = await _dio.get(ApiEndpoints.getUserPreferences(userId));

      print('Full response data: ${jsonEncode(response.data)}');

      if (response.statusCode == 200 && response.data != null) {
        return UserPreferencesApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception('Failed to fetch user preferences. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: $e');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  // Create user preferences
  Future<UserPreferencesEntity> createUserPreferences(UserPreferencesEntity userPreferences) async {
    try {
      var response = await _dio.post(
        ApiEndpoints.createUserPreferences(),
        data: userPreferences.toJson(),
      );

      print('Create response data: ${jsonEncode(response.data)}');

      if (response.statusCode == 201 && response.data != null) {
        return UserPreferencesApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception('Failed to create user preferences.');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: $e');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  // Update user preferences
  Future<UserPreferencesEntity> updateUserPreferences(String userId, UserPreferencesEntity userPreferences) async {
    try {
      var response = await _dio.put(
        ApiEndpoints.updateUserPreferences(userId),
        data: userPreferences.toJson(),
      );

      print('Update response data: ${jsonEncode(response.data)}');

      if (response.statusCode == 200 && response.data != null) {
        return UserPreferencesApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception('Failed to update user preferences.');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: $e');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  // Delete user preferences
  Future<void> deleteUserPreferences(String userId) async {
    try {
      var response = await _dio.delete(ApiEndpoints.deleteUserPreferences(userId));

      print('Delete response status: ${response.statusCode}');

      if (response.statusCode != 200) {
        throw Exception('Failed to delete user preferences.');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: $e');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}

