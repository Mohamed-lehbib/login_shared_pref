import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared/shared_preferences/middleware/login_middleware.dart';
// import 'package:shared/get_storage/middleware/login_middleware.dart';
import 'package:shared/shared_preferences/view/home_screen.dart';
import 'package:shared/shared_preferences/view/login_screen.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => LoginPage(),
    middlewares: [LoginMiddleware()],
  ),
  GetPage(
    name: '/home',
    page: () => HomePage(),
  )
];
