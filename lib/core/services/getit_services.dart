import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tilawat/core/services/upload_data_services.dart';
import 'package:tilawat/features/dashboard/data/repos/upload_data_repo_implementation.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<UploadDataServices>(UploadDataServices(getIt<Dio>()));
  getIt.registerSingleton<UploadDataRepo>(
    UploadDataRepoImplementation(
      uploadDataServices: getIt<UploadDataServices>(),
    ),
  );
}
