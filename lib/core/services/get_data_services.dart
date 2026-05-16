import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tilawat/core/constants/api_constants.dart';
import 'package:tilawat/features/tilawah/data/models/tilawah_model.dart';

part 'get_data_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class GetDataServices {
  factory GetDataServices(Dio dio) = _GetDataServices;

  @GET('/api/recitations/')
  Future<List<TilawahModel>> getRecitations();
}
