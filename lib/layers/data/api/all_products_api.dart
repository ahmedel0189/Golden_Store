import 'package:dio/dio.dart';
import 'package:golden_store/constants/my_strings.dart';

class AllProductsApi {
  late Dio dio;
  AllProductsApi() {
    BaseOptions options = BaseOptions(
      baseUrl: MyUrls.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getallProducts() async {
    try {
      Response response = await dio.get(
        'products',
      );
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
