import 'package:diet_chaiyoo/features/personalisation/domain/use_case/userPreference_usecase.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_bloc.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock dependencies
class MockUpdateUserPreferencesUseCase extends Mock
    implements UpdateUserPreferencesUseCase {}

void main() {
  late UserPreferencesBloc userPreferencesBloc;
  late MockUpdateUserPreferencesUseCase mockUpdateUserPreferencesUseCase;

  setUp(() {
    mockUpdateUserPreferencesUseCase = MockUpdateUserPreferencesUseCase();
    userPreferencesBloc = UserPreferencesBloc(
        updateUserPreferencesUseCase: mockUpdateUserPreferencesUseCase);
  });

  tearDown(() {
    userPreferencesBloc.close();
  });

// Mock entity

  test('initial state should be UserPreferencesInitial', () {
    expect(userPreferencesBloc.state, UserPreferencesInitial());
  });
}

//   blocTest<UserPreferencesBloc, UserPreferencesState>(
//     'emits [UserPreferencesLoading, UserPreferencesUpdatedSuccess] when update is successful',
//     build: () {
//       when(() => mockUpdateUserPreferencesUseCase(userId, userPreferences))
//           .thenAnswer((_) async => Right(userPreferencesEntity));
//       return userPreferencesBloc;
//     },
//     act: (bloc) =>
//         bloc.add(UpdateUserPreferencesEvent(userId, userPreferences)),
//     expect: () => [
//       UserPreferencesLoading(),
//       UserPreferencesUpdatedSuccess(userPreferencesEntity,
//           message: 'User preferences updated successfully'),
//     ],
//     verify: (_) {
//       verify(() => mockUpdateUserPreferencesUseCase(userId, userPreferences))
//           .called(1);
//     },
//   );

//   blocTest<UserPreferencesBloc, UserPreferencesState>(
//     'emits [UserPreferencesLoading, UserPreferencesFailure] when update fails',
//     build: () {
//       when(() => mockUpdateUserPreferencesUseCase(userId, userPreferences))
//           .thenAnswer((_) async => Left(Failure('Failed to update preferences')));
//       return userPreferencesBloc;
//     },
//     act: (bloc) =>
//         bloc.add(UpdateUserPreferencesEvent(userId, userPreferences)),
//     expect: () => [
//       UserPreferencesLoading(),
//       UserPreferencesFailure('Failed to update preferences'),
//     ],
//   );
// }
