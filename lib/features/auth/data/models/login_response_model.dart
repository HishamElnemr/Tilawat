import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';

class LoginResponseModel 
{
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token']);
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(token: token);
  }
}