import '../../../constants/my_strings.dart';
import '../../../helpers/api.dart';

class AllProductsApi {
  Future<List<dynamic>> getallProducts() async {
    return await Api(
      url: MyUrls.allProductUrl,
    ).get(
      endPoint: 'products',
      token: MyKey.authorizationToken,
    );
  }
}
