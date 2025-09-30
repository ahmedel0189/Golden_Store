import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:golden_store/firebase_options.dart';
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( GoldenStore(appRouter: AppRouter(),));
}
