import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/helpers/api.dart';

class CategoryApi {
  Future<List<dynamic>> getCategoryProduct({
    required String categoryName,
  }) async {
    return await Api(
      url: MyUrls.categoryProductUrl,
    ).get(endPoint: categoryName);
  }
}
