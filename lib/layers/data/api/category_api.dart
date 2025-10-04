import '../../../constants/my_strings.dart';
import '../../../helpers/api.dart';

class CategoryApi {
  Future<List<dynamic>> getCategoryProduct({
    required String categoryName,
  }) async {
    return await Api(
      url: MyUrls.categoryProductUrl,
    ).get(
      endPoint: categoryName,
      token: MyKey.authorizationToken,
    );
  }
}
