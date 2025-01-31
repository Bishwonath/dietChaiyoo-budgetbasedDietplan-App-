
import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/app/usecase/usecase.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';


class RegisterUserParams extends Equatable {
  final String full_name;
  final String phone;
  final String image;
  final String username;
  final String password;

  const RegisterUserParams({
    required this.full_name,
    required this.phone,
    required this.image,
    required this.username,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.full_name,
    required this.phone,
    required this.image,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [full_name,  phone, image, username, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      full_Name: params.full_name,
      phone: params.phone,
      image: params.image,
      username: params.username,
      password: params.password,
    );
    return repository.registerUser(authEntity);
  }
}
