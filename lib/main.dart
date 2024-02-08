import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared_preferences/controllers/login_controller.dart';
import 'package:shared/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(LoginController()).initializePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      // home: LoginPage(),
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
