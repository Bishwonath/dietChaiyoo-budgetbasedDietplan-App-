import 'package:bloc/bloc.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/use_case/userPreference_usecase.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_event.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_state.dart';

class UserPreferencesBloc
    extends Bloc<UserPreferencesEvent, UserPreferencesState> {
  final UpdateUserPreferencesUseCase updateUserPreferencesUseCase;

  UserPreferencesBloc({required this.updateUserPreferencesUseCase})
      : super(UserPreferencesInitial()) {
    on<UpdateUserPreferencesEvent>(_onUpdateUserPreferences);
  }

  // ✅ Function that correctly handles UpdateUserPreferencesEvent
  Future<void> _onUpdateUserPreferences(
      UpdateUserPreferencesEvent event, Emitter<UserPreferencesState> emit) async {
    emit(UserPreferencesLoading());

    final result = await updateUserPreferencesUseCase(
      event.userId, 
      event.userPreferences, 
    );

    result.fold(
      (failure) => emit(UserPreferencesFailure(_mapFailureToMessage(failure))),
      (userPreferencesEntity) => emit(
          UserPreferencesUpdatedSuccess(userPreferencesEntity,
              message: 'User preferences updated successfully')),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
