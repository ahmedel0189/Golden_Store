import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/helpers/api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';

class UpdateProductApi {
    Future<ProductModel> updateProduct({
    required String productName,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    final Map<String, String> product =
        await Api(
          url: MyUrls.addProduct,
        ).updateProduct(
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