// auth_repo.mock.dart
import 'package:diet_chaiyoo/app/shared_prefs/token_shared_prefs.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

// Mock the IAuthRepository class
class MockAuthRepository extends Mock implements IAuthRepository {}

// Mock the TokenSharedPrefs class
class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}
