import 'package:tilawat/features/dashboard/domain/entities/tilawah_entity.dart';

class UploadDataStates {}

class UploadDataInitial extends UploadDataStates {}

class UploadDataSuccess extends UploadDataStates {
  final TilawahEntity tilawahEntity;
  UploadDataSuccess(this.tilawahEntity);
}

class UploadDataFailure extends UploadDataStates {
  final String message;
  UploadDataFailure(this.message);
}

class UploadDataLoading extends UploadDataStates {}
