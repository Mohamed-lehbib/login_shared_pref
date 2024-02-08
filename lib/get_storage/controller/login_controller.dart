import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final box = GetStorage(); // GetStorage instance

  String email = "mohamed@gmail.com";
  String password = "password";

  var isLoggedIn = false.obs;
  var emailPreferences = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializePreferences();
    print(isLoggedIn.value);
    print(emailPreferences.value);
  }

  void initializePreferences() {
    final isLoggedInValue = box.read('isLoggedIn');
    final emailValue = box.read('email');

    if (isLoggedInValue != null) {
      isLoggedIn.value = isLoggedInValue;
    }

    if (emailValue != null) {
      emailPreferences.value = emailValue;
    }
  }

  void doLogin() {
    if (validateLoginCredentials()) {
      isLoggedIn.value = true;
      emailPreferences.value = emailController.text.toString();
      box.write('isLoggedIn', isLoggedIn.value);
      box.write('email', emailPreferences.value);
      Get.toNamed('/home');
    } else {
      emailController.clear();
      passwordController.clear();

      Get.snackbar(
        'Login Failed',
        'The email or password is not correct',
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
    return emailController.text.trim() == email &&
        passwordController.text == password;
  }

  void doLogOut() {
    box.remove('isLoggedIn');
    box.remove('email');
    isLoggedIn.value = false;
    Get.offNamed('/');
    print(isLoggedIn.value);
    print(emailPreferences.value);
  }
}
