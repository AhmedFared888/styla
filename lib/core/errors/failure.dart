import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailre extends Failure {
  ServerFailre(super.message);

  factory ServerFailre.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailre('Connection TimeOut with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailre('Send TimeOut with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailre('Receive TimeOut with api server');
      case DioExceptionType.badCertificate:
        return ServerFailre('BadCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailre.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailre('Request to api server was canceld');
      case DioExceptionType.connectionError:
        return ServerFailre('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailre('OPPS There was an Error, pls try later');
    }
  }

  factory ServerFailre.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailre('Your request is not found, pls try later');
    } else if (statusCode == 500) {
      return ServerFailre('There is a problem with server, pls try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailre(response['data']);
    } else {
      return ServerFailre('there was an error, try later');
    }
  }
}
