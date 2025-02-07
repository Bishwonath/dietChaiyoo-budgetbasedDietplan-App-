// import 'package:diet_chaiyoo/core/network/hive_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:diet_chaiyoo/features/auth/data/model/auth_user_model.dart';

// // Mock classes
// class MockBox extends Mock implements Box<AuthHiveModel> {}
// class MockAuthHiveModel extends Mock implements AuthHiveModel {}

// void main() {
//   group('HiveService Tests', () {
//     late HiveService hiveService;
//     late MockBox mockBox;
//     late MockAuthHiveModel mockAuthModel;

//     setUp(() async {
//       // Mock initialization
//       await Hive.initFlutter();
//       hiveService = HiveService();
//       mockBox = MockBox();
//       mockAuthModel = MockAuthHiveModel();
//       when(() => mockBox.put(any(), any())).thenAnswer((_) async {});
//       when(() => mockBox.delete(any())).thenAnswer((_) async {});
//       when(() => mockBox.values).thenReturn([mockAuthModel]);
//       when(() => mockBox.get(any())).thenReturn(mockAuthModel);
//       when(() => mockBox.isOpen).thenReturn(true);

//       // Register a mock adapter for the AuthHiveModel
//       Hive.registerAdapter(AuthHiveModelAdapter());
//     });

//     // test('register method stores user in box', () async {
//     //   // Arrange
//     //   when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//     //   // Act
//     //   await hiveService.register(mockAuthModel);

//     //   // Assert
//     //   verify(() => mockBox.put(any(), mockAuthModel)).called(1);
//     // });

//     test('deleteAuth method deletes user from box', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//       // Act
//       await hiveService.deleteAuth('userId');

//       // Assert
//       verify(() => mockBox.delete('userId')).called(1);
//     });

//     test('getAllAuth method retrieves all users from box', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//       // Act
//       var result = await hiveService.getAllAuth();

//       // Assert
//       expect(result, isA<List<AuthHiveModel>>());
//       expect(result.length, 1);
//       expect(result.first, mockAuthModel);
//     });

//     test('login method returns correct user when credentials match', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);
//       when(() => mockAuthModel.username).thenReturn('testuser');
//       when(() => mockAuthModel.password).thenReturn('password123');

//       // Act
//       var result = await hiveService.login('testuser', 'password123');

//       // Assert
//       expect(result, mockAuthModel);
//     });

//     test('login method returns initial user when credentials do not match', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);
//       when(() => mockAuthModel.username).thenReturn('wronguser');
//       when(() => mockAuthModel.password).thenReturn('wrongpassword');

//       // Act
//       var result = await hiveService.login('testuser', 'password123');

//       // Assert
//       expect(result, isA<AuthHiveModel>());
//       expect(result?.username, '');
//       expect(result?.password, '');
//     });

//     test('clearAll method deletes all users from the box', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//       // Act
//       await hiveService.clearAll();

//       // Assert
//       verify(() => Hive.deleteBoxFromDisk(any())).called(1);
//     });

//     test('clearUserBox method deletes the user box', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//       // Act
//       await hiveService.clearUserBox();

//       // Assert
//       verify(() => Hive.deleteBoxFromDisk(any())).called(1);
//     });

//     test('close method closes the Hive', () async {
//       // Arrange
//       when(() => Hive.openBox<AuthHiveModel>(any())).thenAnswer((_) async => mockBox);

//       // Act
//       await hiveService.close();

//       // Assert
//       verify(() => Hive.close()).called(1);
//     });
//   });
// }
