import 'package:flutter/material.dart';
import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/layers/ui/screens/homae_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => HomaePage(),
        );
      default:
    }
    return null;
  }
}
