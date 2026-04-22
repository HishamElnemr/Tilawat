import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tilawat/core/constants/api_constants.dart';
import 'package:tilawat/features/dashboard/data/models/tilawah_model.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';

part 'upload_data_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UploadDataServices {
  factory UploadDataServices(Dio dio) = _UploadDataServices;

  @POST('/recitations')
  @MultiPart()
  Future<TilawahModel> uploadTilawah({
    @Body() required UploadTilawahRequest request,
  });
}
