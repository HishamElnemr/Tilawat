import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';

class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccess(this.loginResponseEntity);
}

class LoginFailure extends LoginStates {
  final String message;

  LoginFailure(this.message);
}
