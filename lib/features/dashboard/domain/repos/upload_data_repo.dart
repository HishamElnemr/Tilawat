import 'package:dartz/dartz.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';
import 'package:tilawat/features/dashboard/domain/entities/tilawah_entity.dart';

abstract class UploadDataRepo {
  Future<Either<Failure, TilawahEntity>> uploadTilawah(
    UploadTilawahRequest request,
  );
}
