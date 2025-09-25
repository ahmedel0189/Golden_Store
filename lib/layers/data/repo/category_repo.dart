import 'package:golden_store/layers/data/api/category_api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';

class CategoryRepo {
    final CategoryApi categoryApi;

  CategoryRepo({
    required this.categoryApi,
  });

  Future<List<ProductModel>>
  getallProducts({required String categoryName}) async {
    // Product list of json map
    final listOfAllProducts = await categoryApi
        .getCategoryProduct(categoryName:categoryName);
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