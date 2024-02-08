import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared_preferences/controllers/login_controller.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final LoginController loginController = Get.find();
    print("Middleware Check: IsLoggedIn: ${loginController.isLoggedIn}");

    if (loginController.isLoggedIn.value &&
        loginController.emailPreferences.value.isNotEmpty &&
        route == '/') {
      print("Redirecting to Home");
      // User is logged in and trying to navigate to the login page, redirect them to the home page.
      return RouteSettings(name: '/home');
    }
    // No need to redirect, allow navigation to proceed.
    return null;
  }
}
