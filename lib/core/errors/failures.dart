import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message != null && dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 422) {
      if (response is Map<String, dynamic>) {
        final errorMsg = response['message'] ?? response['error'] ?? 'Authentication or validation error ($statusCode)';
        return ServerFailure(errorMsg.toString());
      }
      return ServerFailure('Request failed with status code $statusCode');
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, please try later');
    } else {
      return ServerFailure('Oops, there was an error. Please try again.');
    }
  }
}
