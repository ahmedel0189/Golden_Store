import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'helpers/app_router.dart';
import 'package:hive_flutter/adapters.dart';

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

  // Initialize Hive
  await Hive.initFlutter();

  // Open a box (like a table)
  await Hive.openBox('myBox');
  runApp( GoldenStore(appRouter: AppRouter(),));
}
