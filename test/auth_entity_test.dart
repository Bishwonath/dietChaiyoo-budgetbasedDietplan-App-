import 'package:flutter_test/flutter_test.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';

void main() {
  final authEntity = AuthEntity(
    userId: '123',
    full_Name: 'John Doe',
    image: 'image_url',
    phone: '123456789',
    username: 'johndoe',
    password: 'password123',
  );

  final anotherAuthEntity = AuthEntity(
    userId: '123',
    full_Name: 'John Doe',
    image: 'image_url',
    phone: '123456789',
    username: 'johndoe',
    password: 'password123',
  );

  final differentAuthEntity = AuthEntity(
    userId: '124',
    full_Name: 'Jane Doe',
    image: 'different_image_url',
    phone: '987654321',
    username: 'janedoe',
    password: 'password456',
  );

  group('AuthEntity', () {
    test('should have correct properties', () {
      // Assert
      expect(authEntity.userId, '123');
      expect(authEntity.full_Name, 'John Doe');
      expect(authEntity.image, 'image_url');
      expect(authEntity.phone, '123456789');
      expect(authEntity.username, 'johndoe');
      expect(authEntity.password, 'password123');
    });

    test('should support equality based on properties', () {
      // Assert
      expect(authEntity, equals(anotherAuthEntity));
    });

    test('should not be equal to a different entity', () {
      // Assert
      expect(authEntity, isNot(equals(differentAuthEntity)));
    });
  });
}