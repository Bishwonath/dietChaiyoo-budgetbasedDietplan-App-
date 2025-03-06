import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';

abstract class IUserPreferencesRepository {
  Future<Either<Failure, List<UserPreferencesEntity>>> getUserPreferences(
      String userId);

  updateUserPreferences(String userId, UserPreferencesEntity userPreferences) {}
      
}
