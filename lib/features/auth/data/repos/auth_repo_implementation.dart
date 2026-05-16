import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/core/services/auth_services.dart';
import 'package:tilawat/features/auth/data/models/login_request_body.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthServices authServices;

  AuthRepoImplementation({required this.authServices});

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestBody request,
  ) async {
    try {
      final response = await authServices.login(request: request);
      return Right(response.toEntity());
    } on DioException catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
