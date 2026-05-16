import 'package:dartz/dartz.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/features/auth/data/models/login_request_body.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestBody request);
}
