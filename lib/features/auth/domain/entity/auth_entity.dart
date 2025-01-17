import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable{
  final String? userId;
  final String username;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;

  AuthEntity({ this.userId,required this.username, required this.phoneNo,required this.fullName, required this.email, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userId,username,fullName,email,password,phoneNo];
  
}