import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/core/services/get_data_services.dart';
import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';
import 'package:tilawat/features/tilawah/domain/repos/tilawah_repo.dart';

class TilawahRepoImplementation implements TilawahRepo {
  final GetDataServices getDataServices;

  TilawahRepoImplementation({required this.getDataServices});

  @override
  Future<Either<Failure, List<TilawahEntity>>> getRecitations() async {
    try {
      final response = await getDataServices.getRecitations();
      return Right(response.map((item) => item.toEntity()).toList());
    } on DioException catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
