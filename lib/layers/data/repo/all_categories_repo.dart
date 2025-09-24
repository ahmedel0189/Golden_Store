import 'package:golden_store/layers/data/api/all_categories_api.dart';

class AllCategoriesRepositories {
  final AllCategoriesApi allCategoriesApi;

  AllCategoriesRepositories({
    required this.allCategoriesApi,
  });

  Future<List<dynamic>>
  getallCategories() async {
    // characters list of json map
    final listOfAllCategories =
        await allCategoriesApi.getallCategories();
    // return list of character model
    return listOfAllCategories;
  }
}
