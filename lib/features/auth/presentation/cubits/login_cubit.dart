import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/auth/data/models/login_request_body.dart';
import 'package:tilawat/features/auth/domain/repos/auth_repo.dart';
import 'package:tilawat/features/auth/presentation/cubits/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required LoginRequestBody loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.login(loginRequest);

    response.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
    );
  }
}
