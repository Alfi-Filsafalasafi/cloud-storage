import 'package:cobafirebasealfi/app/controllers/auth_controller.dart';
import 'package:cobafirebasealfi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.passwordC,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(
              height: 6,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                child: Text("Lupa Password "),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => authC.login(
                  controller.emailC.text, controller.passwordC.text),
              child: Text("Login"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Belum punya akun ?"),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("Daftar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
