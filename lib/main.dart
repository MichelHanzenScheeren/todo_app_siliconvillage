import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/shared/bindings.dart';
import 'package:todo_app_siliconvillage/shared/routes.dart';
import 'presentation/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding()..dependencies(),
      title: 'To-do app Silicon Village',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages(),
      home: HomeScreen(),
    );
  }
}
