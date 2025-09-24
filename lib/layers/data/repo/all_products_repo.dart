import 'package:golden_store/layers/data/api/all_products_api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';

class AllProductsRepositories {
  final AllProductsApi allProductsApi;

  AllProductsRepositories({
    required this.allProductsApi,
  });

  Future<List<ProductModel>> getallProducts() async {
    // characters list of json map
    final listOfAllProducts = await allProductsApi
        .getallProducts();
    // return list of character model
    return listOfAllProducts
    // Iterable of maps of character model
        .map(
          (product) =>
              ProductModel.fromJson(product),
        )
        .toList();
  }
}