import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tilawat/features/auth/data/models/login_request_body.dart';
import 'package:tilawat/features/auth/data/models/login_response_model.dart';

import '../constants/api_constants.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio) = _AuthServices;

  @POST('/api/auth/login')
  Future<LoginResponseModel> login({@Body() required LoginRequestBody request});
}
