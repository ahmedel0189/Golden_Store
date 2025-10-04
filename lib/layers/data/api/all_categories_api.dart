import '../../../constants/my_strings.dart';
import '../../../helpers/api.dart';

class AllCategoriesApi {
  Future<List<dynamic>> getallCategories() async {
    return await Api(
      url: MyUrls.allProductUrl,
    ).get(
      endPoint: 'categories',
      token: MyKey.authorizationToken,
    );
  }
}
