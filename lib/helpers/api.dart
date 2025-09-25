import 'package:dio/dio.dart';

class Api {
  late Dio dio;
  final String url;
  Api({required this.url}) {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> get({
    required String endPoint,
  }) async {
    try {
      final response = await dio.get(endPoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
          "GET request error: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("GET request error: $e");
    }
  }
}
