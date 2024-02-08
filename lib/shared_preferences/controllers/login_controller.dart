import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  String email = "mohamed@gmail.com";
  String password = "password";

  var isLoggedIn = false.obs;
  var emailPreferences = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await initializePreferences();
    print(isLoggedIn.value);
    print(emailPreferences.value);
  }

  Future<void> initializePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool("isLoggedIn") ?? false;
    emailPreferences.value = prefs.getString("email") ?? '';
  }

  Future<void> doLogin() async {
    if (validateLoginCredentials()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoggedIn.value = true;
      emailPreferences.value = emailController.text.toString();
      prefs.setString("email", emailPreferences.value);
      prefs.setBool("isLoggedIn", isLoggedIn.value);
      Get.toNamed('/home');
    } else {
      // Clear the text fields
      emailController.clear();
      passwordController.clear();

      // Show a snack bar with an error message
      Get.snackbar(
        'Login Failed', // Title
        'The email or password is not correct', // Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 3),
      );
    }
  }

  bool validateLoginCredentials() {
    if (emailController.text.trim() == email &&
        passwordController.text == password) {
      return true;
    } else {
      return false;
    }
  }

  void doLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.setString("email", "");
    isLoggedIn.value = false;
    Get.offNamed('/');
    print(isLoggedIn.value);
    print(emailPreferences.value);
  }
}
