import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/core/services/upload_data_services.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';
import 'package:tilawat/features/dashboard/domain/entities/tilawah_entity.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';

class UploadDataRepoImplementation implements UploadDataRepo {
  final UploadDataServices uploadDataServices;

  UploadDataRepoImplementation({required this.uploadDataServices});

  @override
  Future<Either<Failure, TilawahEntity>> uploadTilawah(
    UploadTilawahRequest request,
  ) async {
    try {
      final response = await uploadDataServices.uploadTilawah(request: request);
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
