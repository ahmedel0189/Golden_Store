import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_store/layers/ui/screens/update_product.dart';
import '../constants/my_strings.dart';
import '../layers/domain/logic/cubit/products_cubit.dart';
import '../layers/ui/screens/main_home_page.dart';
import 'package:hive/hive.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final myBox = Hive.box('myBox');

    switch (settings.name) {
      case MyRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsCubit(myBox: myBox),
            child: const MainHomePage(),
          ),
        );

      case MyRoutes.updateProductRoute:
        return MaterialPageRoute(
          builder: (_) => UpdateProduct()
          );
        
      default:
        return null; // or a fallback error page
    }
  }
}
