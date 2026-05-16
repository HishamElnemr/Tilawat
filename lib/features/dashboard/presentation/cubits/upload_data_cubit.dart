import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';
import 'package:tilawat/features/dashboard/presentation/cubits/upload_data_states.dart';

class UploadDataCubit extends Cubit<UploadDataStates> {
  UploadDataCubit(this.uploadDataRepo) : super(UploadDataInitial());
  final UploadDataRepo uploadDataRepo;

  Future<void> uploadData({
    required UploadTilawahRequest uploadDataRequest,
    required LoginResponseEntity token,
  }) async {
    emit(UploadDataLoading());

    try {
      final response = await uploadDataRepo.uploadTilawah(
        uploadDataRequest,
        token,
      );

      response.fold(
        (failure) {
          emit(UploadDataFailure(failure.errMessage));
        },
        (tilawah) {
          emit(UploadDataSuccess(tilawah));
        },
      );
    } catch (e) {
      emit(UploadDataFailure('حدث خطأ غير متوقع أثناء إضافة التلاوة'));
    }
  }
}
