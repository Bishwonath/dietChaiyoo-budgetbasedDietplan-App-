import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/repository/userPreferences_repository.dart';

class UpdateUserPreferencesUseCase {
  final IUserPreferencesRepository userPreferencesRepository;

  UpdateUserPreferencesUseCase({required this.userPreferencesRepository});


  // The method to update user preferences
  Future<Either<Failure, UserPreferencesEntity>> call(String userId, UserPreferencesEntity userPreferences) async {
    return await userPreferencesRepository.updateUserPreferences(userId, userPreferences);
  }
}
