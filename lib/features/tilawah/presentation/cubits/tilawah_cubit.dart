import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/tilawah/domain/repos/tilawah_repo.dart';
import 'package:tilawat/features/tilawah/presentation/cubits/tilawah_states.dart';

class TilawahCubit extends Cubit<TilawahStates> {
  TilawahCubit(this.tilawahRepo) : super(TilawahInitial());

  final TilawahRepo tilawahRepo;

  Future<void> getRecitations() async {
    emit(TilawahLoading());
    final response = await tilawahRepo.getRecitations();

    response.fold(
      (failure) => emit(TilawahFailure(failure.errMessage)),
      (recitations) => emit(TilawahSuccess(recitations)),
    );
  }
}
