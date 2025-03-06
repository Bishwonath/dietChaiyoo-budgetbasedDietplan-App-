import 'package:diet_chaiyoo/features/auth/presentation/view/login_view.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:diet_chaiyoo/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;
  late SplashCubit splashCubit;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
    splashCubit = SplashCubit(mockLoginBloc);
  });

  testWidgets('SplashCubit should navigate to LoginView after delay',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            splashCubit.init(context);
            return const Scaffold(body: Text('Splash Screen'));
          },
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 2)); // Simulate delay
    await tester.pumpAndSettle(); // Wait for navigation

    expect(find.byType(LoginView), findsOneWidget);
  });
}
