import 'package:dio/dio.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';
import 'package:tilawat/features/tilawah/data/models/tilawah_model.dart';

class UploadDataServices {
  final Dio _dio;

  UploadDataServices(this._dio);

  Future<TilawahModel> uploadTilawah({
    required String token,
    required UploadTilawahRequest request,
  }) async {
    final FormData formData = await request.toFormData();

    final response = await _dio.post(
      '/api/recitations',
      data: formData,
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );

    return TilawahModel.fromJson(response.data as Map<String, dynamic>);
  }
}
