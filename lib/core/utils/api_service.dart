import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = 'https://fakestoreapi.com/';

  ApiService(this._dio) {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.sendTimeout = const Duration(seconds: 10);
  }

  Future<dynamic> get({required String endPoint}) async {
    try {
      var response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    } on DioException catch (e) {
      //print('❌ API Error for $endPoint: ${e.message}');
      rethrow;
    } catch (e) {
      // print('❌ Unexpected error for $endPoint: $e');
      rethrow;
    }
  }
}
