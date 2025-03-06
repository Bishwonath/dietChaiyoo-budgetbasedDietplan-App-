// import 'package:diet_chaiyoo/app/shared_prefs/token_shared_prefs.dart';
// import 'package:diet_chaiyoo/core/error/failure.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dartz/dartz.dart';


// // @GenerateMocks([SharedPreferences])
// // void main() {
// //   late MockSharedPreferences mockSharedPreferences;
// //   late TokenSharedPrefs tokenSharedPrefs;

// //   setUp(() {
// //     mockSharedPreferences = MockSharedPreferences();
// //     tokenSharedPrefs = TokenSharedPrefs(mockSharedPreferences);
// //   });

//   // group('TokenSharedPrefs Tests', () {
//   //   const testToken = 'test_token';

//     test('saveToken should return Right(null) when saving succeeds', () async {
//       when(mockSharedPreferences.setString('token', testToken))
//           .thenAnswer((_) async => true);

//       final result = await tokenSharedPrefs.saveToken(testToken);

//       expect(result, equals(Right(null)));
//       verify(mockSharedPreferences.setString('token', testToken)).called(1);
//     });

//     test('saveToken should return Left(SharedPrefsFailure) when saving fails', () async {
//       when(mockSharedPreferences.setString('token', testToken))
//           .thenThrow(Exception('Storage Error'));

//       final result = await tokenSharedPrefs.saveToken(testToken);

//       expect(result, isA<Left<Failure, void>>());
//       expect((result as Left).value, isA<SharedPrefsFailure>());
//     });

//     test('getToken should return Right(token) when retrieving succeeds', () async {
//       when(mockSharedPreferences.getString('token')).thenReturn(testToken);

//       final result = await tokenSharedPrefs.getToken();

//       expect(result, equals(Right(testToken)));
//       verify(mockSharedPreferences.getString('token')).called(1);
//     });

//     test('getToken should return Right("") when no token is found', () async {
//       when(mockSharedPreferences.getString('token')).thenReturn(null);

//       final result = await tokenSharedPrefs.getToken();

//       expect(result, equals(Right('')));
//       verify(mockSharedPreferences.getString('token')).called(1);
//     });

//     test('getToken should return Left(SharedPrefsFailure) on exception', () async {
//       when(mockSharedPreferences.getString('token'))
//           .thenThrow(Exception('Retrieval Error'));

//       final result = await tokenSharedPrefs.getToken();

//       expect(result, isA<Left<Failure, String>>());
//       expect((result as Left).value, isA<SharedPrefsFailure>());
//     });
//   });
// }
