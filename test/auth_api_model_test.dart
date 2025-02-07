import 'package:flutter_test/flutter_test.dart';
import 'package:diet_chaiyoo/features/auth/data/model/auth_api_model.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';

void main() {
  const authApiModelJson = {
    '_id': '123',
    'full_name': 'John Doe',
    'image': 'image_url',
    'phone': '123456789',
    'username': 'johndoe',
    'password': 'password123'
  };

  final authApiModel = AuthApiModel(
    id: '123',
    full_name: 'John Doe',
    image: 'image_url',
    phone: '123456789',
    username: 'johndoe',
    password: 'password123',
  );

  final authEntity = AuthEntity(
    full_Name: 'John Doe',
    phone: '123456789',
    image: 'image_url',
    username: 'johndoe',
    password: 'password123',
  );

  group('AuthApiModel', () {
    test('should correctly deserialize from JSON', () {
      // Act
      final model = AuthApiModel.fromJson(authApiModelJson);

      // Assert
      expect(model.id, '123');
      expect(model.full_name, 'John Doe');
      expect(model.image, 'image_url');
      expect(model.phone, '123456789');
      expect(model.username, 'johndoe');
      expect(model.password, 'password123');
    });

    test('should correctly serialize to JSON', () {
      // Act
      final json = authApiModel.toJson();

      // Assert
      expect(json['_id'], '123');
      expect(json['full_name'], 'John Doe');
      expect(json['image'], 'image_url');
      expect(json['phone'], '123456789');
      expect(json['username'], 'johndoe');
      expect(json['password'], 'password123');
    });

    test('should convert to AuthEntity correctly', () {
      // Act
      final entity = authApiModel.toEntity();

      // Assert
      expect(entity.full_Name, 'John Doe');
      expect(entity.phone, '123456789');
      expect(entity.image, 'image_url');
      expect(entity.username, 'johndoe');
      expect(entity.password, 'password123');
    });

    test('should convert from AuthEntity correctly', () {
      // Act
      final model = AuthApiModel.fromEntiy(authEntity);

      // Assert
      expect(model.full_name, 'John Doe');
      expect(model.phone, '123456789');
      expect(model.image, 'image_url');
      expect(model.username, 'johndoe');
      expect(model.password, 'password123');
    });
  });
}
