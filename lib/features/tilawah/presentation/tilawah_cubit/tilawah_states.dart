import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';

class TilawahStates {}

class TilawahInitial extends TilawahStates {}

class TilawahLoading extends TilawahStates {}

class TilawahSuccess extends TilawahStates {
  final List<TilawahEntity> recitations;

  TilawahSuccess(this.recitations);
}

class TilawahFailure extends TilawahStates {
  final String message;

  TilawahFailure(this.message);
}
