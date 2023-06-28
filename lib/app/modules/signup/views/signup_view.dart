import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
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
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => authC.signup(
                  controller.emailC.text, controller.passwordC.text),
              child: Text("Daftar"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Sudah punya akun ?"),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
