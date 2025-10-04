import '../api/all_products_api.dart';
import '../models/product_model.dart';

class AllProductsRepositories {
  final AllProductsApi allProductsApi;

  AllProductsRepositories({
    required this.allProductsApi,
  });

  Future<List<ProductModel>>
  getallProducts() async {
    // Product list of json map
    final listOfAllProducts = await allProductsApi
        .getallProducts();
    // return list of Product model
    return listOfAllProducts
        // Iterable of maps of Product model
        .map(
          (product) =>
              ProductModel.fromJson(product),
        )
        .toList();
  }
}
