import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockUploadImageUsecase mockUploadImageUsecase;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockUploadImageUsecase = MockUploadImageUsecase();

    registerBloc = RegisterBloc(
      registerUseCase: mockRegisterUseCase,
      uploadImageUsecase: mockUploadImageUsecase,
    );
  });

  test('initial state is correct', () {
    expect(registerBloc.state, RegisterState.initial());
  });

  blocTest<RegisterBloc, RegisterState>(
    'emits [loading, success] when courses and batches are loaded',
    build: () => registerBloc,
    act: (bloc) => bloc.add(LoadCoursesAndBatches()),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
  );

  blocTest<RegisterBloc, RegisterState>(
    'emits [loading, success] when registration is successful',
    build: () {
      when(() => mockRegisterUseCase(any())).thenAnswer(
        (_) async => Right('User Registered'),
      );
      return registerBloc;
    },
    act: (bloc) => bloc.add(RegisterUser(
      full_Name: "Test User",
      phone: "123456789",
      username: "testuser",
      password: "password123",
      image: "test_image.jpg",
      context: MockBuildContext(),
    )),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
  );

  blocTest<RegisterBloc, RegisterState>(
    'emits [loading, failure] when registration fails',
    build: () {
      // when(() => mockRegisterUseCase(any())).thenAnswer(
      //   (_) async => Left(Failure('Registration failed')),
      // );
      return registerBloc;
    },
    act: (bloc) => bloc.add(RegisterUser(
      full_Name: "Test User",
      phone: "123456789",
      username: "testuser",
      password: "password123",
      image: "test_image.jpg",
      context: MockBuildContext(),
    )),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
  );

  // blocTest<RegisterBloc, RegisterState>(
  //   'emits [loading, success] when image upload is successful',
  //   build: () {
  //     when(() => mockUploadImageUsecase(any())).thenAnswer(
  //       (_) async => Right('Image Uploaded'),
  //     );
  //     return registerBloc;
  //   },
  //   // act: (bloc) => bloc.add(UploadImageEvent(
  //   //   img: "test_image.jpg",
  //   //   context: MockBuildContext(),
  //   )),
  //   expect: () => [
  //     RegisterState.initial().copyWith(isLoading: true),
  //     RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
  //   ],
  // );

  // blocTest<RegisterBloc, RegisterState>(
  //   'emits [loading, failure] when image upload fails',
  //   build: () {
  //     when(() => mockUploadImageUsecase(any())).thenAnswer(
  //       (_) async => Left(Failure('Upload failed')),
  //     );
  //     return registerBloc;
  //   },
  //   act: (bloc) => bloc.add(UploadImageEvent(
  //     img: "test_image.jpg",
  //     context: MockBuildContext(),
  //   )),
  //   expect: () => [
  //     RegisterState.initial().copyWith(isLoading: true),
  //     RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
  //   ],
  // );

  tearDown(() {
    registerBloc.close();
  });
}

class MockBuildContext extends Mock implements BuildContext {}
