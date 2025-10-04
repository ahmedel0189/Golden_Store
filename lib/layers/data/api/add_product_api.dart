import '../../../constants/my_strings.dart';
import '../../../helpers/api.dart';
import '../models/product_model.dart';

class AddProductApi {
  Future<ProductModel> addProduct({
    required String productName,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    final Map<String, String> product =
        await Api(
          url: MyUrls.addProductUrl,
        ).postProduct(
          body: {
            'title': productName,
            'price': price,
            'description': description,
            'image': image,
            'category': category,
          },
          token: MyKey.authorizationToken,
        );
    return ProductModel.fromJson(product);
  }
}
