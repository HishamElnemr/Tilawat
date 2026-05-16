import 'package:dartz/dartz.dart';
import 'package:tilawat/core/errors/failures.dart';
import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';

abstract class TilawahRepo {
  Future<Either<Failure, List<TilawahEntity>>> getRecitations();
}
