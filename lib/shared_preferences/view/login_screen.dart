import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shared/shared_preferences/controllers/login_controller.dart';
// import 'package:shared/get_storage/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'login',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(height: 40),
              Form(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: loginController.emailController,
                    decoration: const InputDecoration(
                      label: Text("email"),
                      hintText: "example@email.com",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    controller: loginController.passwordController,
                    decoration: const InputDecoration(
                      hintText: "password",
                      label: Text("password"),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      loginController.doLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text("Login"),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
