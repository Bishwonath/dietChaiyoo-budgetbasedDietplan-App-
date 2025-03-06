import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock repository class
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository repository;
  late RegisterUseCase usecase;

  // Setup before each test
  setUp(() {
    repository = MockAuthRepository();
    usecase = RegisterUseCase(repository);
    // Register a fallback value for any AuthEntity mock
    registerFallbackValue(const AuthEntity(
      userId: '',
      full_Name: '',
      image: '',
      phone: '',
      username: '',
      password: '',
    ));
  });

  // Define sample RegisterUserParams for tests
  const params = RegisterUserParams(
    full_name: 'John Doe',
    phone: '1234567890',
    image: 'image.png',
    username: 'johndoe',
    password: 'password123',
  );

  // Test case 1: Should register user successfully
  test('should register user successfully', () async {
    // Arrange
    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(null));
    verify(() => repository.registerUser(any())).called(1);
    verifyNoMoreInteractions(repository);
  });

  // Test case 2: Should return ApiFailure when registration fails
  test('should return ApiFailure when user registration fails', () async {
    // Arrange
    final failure = ApiFailure(message: "Registration failed");
    when(() => repository.registerUser(any())).thenAnswer(
      (_) async => Left(failure),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, Left(failure));
    verify(() => repository.registerUser(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
