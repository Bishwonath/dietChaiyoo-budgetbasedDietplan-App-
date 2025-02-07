import 'package:diet_chaiyoo/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginParams', () {
    test('should have correct properties', () {
      // Arrange
      final params = LoginParams(email: 'test@example.com', password: 'password123');

      // Assert
      expect(params.email, 'test@example.com');
      expect(params.password, 'password123');
    });

    test('should have initial values when using LoginParams.initial()', () {
      // Arrange
      final params = LoginParams.initial();

      // Assert
      expect(params.email, '');
      expect(params.password, '');
    });

    test('should support equality based on properties', () {
      // Arrange
      final params1 = LoginParams(email: 'test@example.com', password: 'password123');
      final params2 = LoginParams(email: 'test@example.com', password: 'password123');

      // Assert
      expect(params1, equals(params2));
    });

    test('should not be equal to different parameters', () {
      // Arrange
      final params1 = LoginParams(email: 'test@example.com', password: 'password123');
      final params2 = LoginParams(email: 'other@example.com', password: 'password456');

      // Assert
      expect(params1, isNot(equals(params2)));
    });
  });
}
