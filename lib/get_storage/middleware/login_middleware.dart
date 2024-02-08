import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/get_storage/controller/login_controller.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final LoginController loginController = Get.put(LoginController());
    print("Middleware Check: IsLoggedIn: ${loginController.isLoggedIn}");

    if (loginController.isLoggedIn.value &&
        loginController.emailPreferences.value.isNotEmpty &&
        route == '/') {
      print("Redirecting to Home");
      return RouteSettings(name: '/home');
    }

    return null;
  }
}
