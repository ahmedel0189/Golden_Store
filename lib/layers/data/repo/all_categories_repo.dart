import '../api/all_categories_api.dart';

class AllCategoriesRepositories {
  final AllCategoriesApi allCategoriesApi;

  AllCategoriesRepositories({
    required this.allCategoriesApi,
  });

  Future<List<dynamic>> getallCategories() async {
    // characters list of json map
    final List<dynamic> listOfAllCategories =
        await allCategoriesApi.getallCategories()
          ..map((e) => e.toString()).toList();
    // return list of Categories
    return listOfAllCategories;
  }
}
