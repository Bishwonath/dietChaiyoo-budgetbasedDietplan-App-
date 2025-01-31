import 'dart:io';

import 'package:diet_chaiyoo/app/constants/api_endpoints.dart';
import 'package:diet_chaiyoo/features/auth/data/data_source/auth_data_source.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);
  @override
  Future<AuthEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      Response response = await _dio.post(ApiEndpoints.loginUser,
          data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        return "logged in sucessfully";
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      print("remote data source ma image ${user.image}");
      Response response = await _dio.post(ApiEndpoints.registerUser, data: {
        "full_name": user.full_Name,
        "phone": user.phone,
        "image": user.image,
        "username": user.username,
        "password": user.password
      });
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName, // Use the filename from the file path
        ),
      },
      );
      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
