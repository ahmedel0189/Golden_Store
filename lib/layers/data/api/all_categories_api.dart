import 'package:dio/dio.dart';
import 'package:golden_store/constants/my_strings.dart';

class AllCategoriesApi {
  late Dio dio;
  AllCategoriesApi() {
    BaseOptions options = BaseOptions(
      baseUrl: MyUrls.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getallCategories() async {
    try {
      Response response = await dio.get(
        'categories',
      );
      return (response.data);
    } catch (e) {
      return [];
    }
  }
}
