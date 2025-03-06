import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view/user_preference_view.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  late LoginBloc loginBloc;
  late MockRegisterBloc mockRegisterBloc;
  late MockHomeCubit mockHomeCubit;
  late MockLoginUsecase mockLoginUsecase;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();
    mockHomeCubit = MockHomeCubit();
    mockLoginUsecase = MockLoginUsecase();

    loginBloc = LoginBloc(
      registerBloc: mockRegisterBloc,
      homeCubit: mockHomeCubit,
      loginUseCase: mockLoginUsecase,
    );
  });

  test('initial state is correct', () {
    expect(loginBloc.state, LoginState.initial());
  });

  blocTest<LoginBloc, LoginState>(
    'emits [loading, success] when login is successful',
    build: () {
      when(() => mockLoginUsecase(any())).thenAnswer(
        (_) async => Right('mocked_token'),
      );
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginUserEvent(
      username: 'test@example.com',
      password: 'password123',
      context: MockBuildContext(),
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'emits [loading, failure] when login fails',
    build: () {
      // when(() => mockLoginUsecase(any())).thenAnswer(
      //   // (_) async => Left(Failure(message: 'Login failed')),
      // );
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginUserEvent(
      username: 'wrong@example.com',
      password: 'wrongpass',
      context: MockBuildContext(),
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'navigates to UserPreferencesPage after successful login',
    build: () {
      when(() => mockLoginUsecase(any())).thenAnswer(
        (_) async => Right('mocked_token'),
      );
      return loginBloc;
    },
    act: (bloc) => bloc.add(NavigateUserPreferencesPageEvent(
      context: MockBuildContext(),
      userId: 'mocked_token',
    )),
    verify: (_) {
      // Ensure navigation logic executes correctly
      verifyNever(() => mockRegisterBloc.close());
    },
  );

  tearDown(() {
    loginBloc.close();
  });
}

class MockBuildContext extends Mock implements BuildContext {}
