import 'package:flutter/material.dart';
import 'package:golden_store/helpers/app_router.dart';

class GoldenStore extends StatelessWidget {
  final AppRouter appRouter;
  const GoldenStore({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Store',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

void main() {
  runApp( GoldenStore(appRouter: AppRouter(),));
}
