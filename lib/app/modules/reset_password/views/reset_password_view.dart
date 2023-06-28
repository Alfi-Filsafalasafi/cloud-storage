import 'package:cobafirebasealfi/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPasswordView'),
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
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => authC.reset_password(
                controller.emailC.text,
              ),
              child: Text("Reset"),
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
