import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/helpers/api.dart';

class AllCategoriesApi {
  Future<List<dynamic>> getallCategories() async {
    return await Api(
      url: MyUrls.allProductUrl,
    ).get(endPoint: 'categories');
  }
}
