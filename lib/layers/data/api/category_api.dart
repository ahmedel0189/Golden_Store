import 'package:dio/dio.dart';
import 'package:golden_store/constants/my_strings.dart';

class CategoryApi {
    late Dio dio;
  CategoryApi() {
    BaseOptions options = BaseOptions(
      baseUrl: MyUrls.categoryProductUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getCategoryProduct({required String categoryName}) async {
    try {
      Response response = await dio.get(
        categoryName,
      );
      return response.data;
    } catch (e) {
      return [];
    }
  }
}