import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shared/shared_preferences/controllers/login_controller.dart';
// import 'package:shared/get_storage/controller/login_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "${loginController.emailPreferences.value}!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  loginController.doLogOut();
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    fixedSize: const Size(200, 50)),
                child: const Text('LogOut'))
          ],
        ),
      ),
    );
  }
}
