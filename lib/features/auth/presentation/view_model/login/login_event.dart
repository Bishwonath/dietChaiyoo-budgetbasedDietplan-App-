part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateRegisterScreenEvent({
    required this.context,
    required this.destination,
  });
}

class NavigateHomeScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateHomeScreenEvent({
    required this.context,
    required this.destination,
  });
}

class NavigateUserPreferencesPageEvent extends LoginEvent {
  final BuildContext context;
  final String userId; // Add any other necessary data here, like userId

  const NavigateUserPreferencesPageEvent({
    required this.context,
    required this.userId, // Ensure the user ID is passed to navigate
  });
}

class LoginUserEvent extends LoginEvent {
  final BuildContext context;
  final String username;
  final String password;

  const LoginUserEvent({
    required this.context,
    required this.username,
    required this.password,
  });
}
