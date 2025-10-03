import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/layers/domain/logic/cubit/products_cubit.dart';
import 'package:golden_store/layers/ui/screens/main_home_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsCubit(),
            child: const MainHomePage(),
          ),
        );
      default:
        return null; // or a fallback error page
    }
  }
}
