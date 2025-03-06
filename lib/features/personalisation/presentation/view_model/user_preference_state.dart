
import 'package:diet_chaiyoo/features/personalisation/domain/entity/userPreferences_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserPreferencesState extends Equatable {
  const UserPreferencesState();

  @override
  List<Object> get props => [];
}

class UserPreferencesInitial extends UserPreferencesState {}

class UserPreferencesLoading extends UserPreferencesState {}

class UserPreferencesUpdatedSuccess extends UserPreferencesState {
  final String message; // Add a message parameter

  const UserPreferencesUpdatedSuccess(UserPreferencesEntity userPreferencesEntity, {required this.message}); // Update constructor

  @override
  List<Object> get props => [message]; // Include message in props
}

class UserPreferencesFailure extends UserPreferencesState {
  final String error;

  const UserPreferencesFailure(this.error);

  @override
  List<Object> get props => [error];

  String? get message => null;

}