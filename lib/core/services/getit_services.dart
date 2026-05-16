import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tilawat/core/constants/api_constants.dart';
import 'package:tilawat/core/services/auth_services.dart';
import 'package:tilawat/core/services/get_data_services.dart';
import 'package:tilawat/core/services/upload_data_services.dart';
import 'package:tilawat/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:tilawat/features/auth/domain/repos/auth_repo.dart';
import 'package:tilawat/features/dashboard/data/repos/upload_data_repo_implementation.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';
import 'package:tilawat/features/tilawah/data/repos/tilawah_repo_implementation.dart';
import 'package:tilawat/features/tilawah/domain/repos/tilawah_repo.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<AuthServices>(AuthServices(getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(authServices: getIt<AuthServices>()),
  );
  getIt.registerSingleton<UploadDataServices>(UploadDataServices(getIt<Dio>()));
  getIt.registerSingleton<UploadDataRepo>(
    UploadDataRepoImplementation(
      uploadDataServices: getIt<UploadDataServices>(),
    ),
  );
  getIt.registerSingleton<GetDataServices>(GetDataServices(getIt<Dio>()));
  getIt.registerSingleton<TilawahRepo>(
    TilawahRepoImplementation(getDataServices: getIt<GetDataServices>()),
  );
}
