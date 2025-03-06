import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure Equatability Tests', () {
    const failureMessage = 'An error occurred';

    test('LocalDatabaseFailure should have correct message and be equatable', () {
      const failure1 = LocalDatabaseFailure(message: failureMessage);
      const failure2 = LocalDatabaseFailure(message: failureMessage);
      const failure3 = LocalDatabaseFailure(message: 'Different message');

      expect(failure1.message, equals(failureMessage));
      expect(failure1, equals(failure2)); // Should be equal
      expect(failure1, isNot(equals(failure3))); // Should not be equal
    });

    test('ApiFailure should have correct message and statusCode', () {
      const failure1 = ApiFailure(message: failureMessage, statusCode: 400);
      const failure2 = ApiFailure(message: failureMessage, statusCode: 400);
      const failure3 = ApiFailure(message: failureMessage, statusCode: 500);

      expect(failure1.message, equals(failureMessage));
      expect(failure1.statusCode, equals(400));
      expect(failure1, equals(failure2)); // Should be equal
      expect(failure1, isNot(equals(failure3))); // Should not be equal
    });

    test('SharedPrefsFailure should have correct message and be equatable', () {
      const failure1 = SharedPrefsFailure(message: failureMessage);
      const failure2 = SharedPrefsFailure(message: failureMessage);
      const failure3 = SharedPrefsFailure(message: 'Different message');

      expect(failure1.message, equals(failureMessage));
      expect(failure1, equals(failure2)); // Should be equal
      expect(failure1, isNot(equals(failure3))); // Should not be equal
    });
  });
}
