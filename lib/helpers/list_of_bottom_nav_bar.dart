import 'package:flutter/widgets.dart';
import '../layers/ui/screens/add_product_page.dart';
import '../layers/ui/screens/fav_products_page.dart';
import '../layers/ui/screens/homae_page.dart';

class ListOfBottomNavBar {
  static List<Widget> listOfBottomNavBar = [
    HomaePage(),
    AddProductPage(),
    FavProductsPage(),
  ];
}
