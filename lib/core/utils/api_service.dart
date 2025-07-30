import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = 'https://fakestoreapi.com/';
  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
