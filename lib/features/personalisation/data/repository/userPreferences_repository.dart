import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/personalisation/data/data_source/userPreferences_remote_data_source.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/repository/userPreferences_repository.dart';

class UserPreferencesRemoteRepository implements IUserPreferencesRepository {
  final UserPreferencesRemoteDataSource remoteDataSource;

  UserPreferencesRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserPreferencesEntity>>> getUserPreferences(String userId) async {
    try {
      // Pass the userId as an argument to getUserPreferences
      final preferences = await remoteDataSource.getUserPreferences(userId);

      // Return as a List
      return Right([preferences]);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
   Future<Either<Failure, UserPreferencesEntity>> updateUserPreferences(String userId, UserPreferencesEntity userPreferences) async {
    try {
      final updatedPreferences = await remoteDataSource.updateUserPreferences(userId, userPreferences);
      return Right(updatedPreferences);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));  // Handle API failures
    }
  }

}

