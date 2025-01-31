import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/app/usecase/usecase.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';


class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});
  
  const LoginParams.initial():
  username='',
  password='';
  
  
  @override
  List<Object?> get props => [username,password];
}


class LoginUsecase implements UsecaseWithParams<String,LoginParams>{
  final IAuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
// IF api then store token in shared preferences
    return repository.loginUser(params.username, params.password);
  }

  
}