import 'package:dartz/dartz.dart';
import 'package:diet_chaiyoo/app/usecase/usecase.dart';
import 'package:diet_chaiyoo/core/error/failure.dart';
import 'package:diet_chaiyoo/features/auth/domain/entity/auth_entity.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';


class RegisterUserParams extends Equatable{
  final String fullName;
  final String email;
  final String username;
  final String phoneNo;
  final String password;

  const RegisterUserParams({
    required this.fullName,
    required this.email,
    required this.username,
    required this.phoneNo,
    required this.password
  });


   const RegisterUserParams.initial():
  fullName= '',
  email='',
  username='',
  phoneNo='',
  password = '';

  @override
  List<Object?> get props => [fullName,email,username,phoneNo,password];

}

class RegisterUserUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository authRepository;

  RegisterUserUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity =AuthEntity(
      username: params.username, 
      fullName: params.fullName, 
      email: params.email, 
      phoneNo: params.phoneNo,
      password: params.password); 
    
    return authRepository.createUser(authEntity);
  }

}