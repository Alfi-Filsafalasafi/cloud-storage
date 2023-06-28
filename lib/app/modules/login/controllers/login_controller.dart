import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "alfifilsafat@gmail.com");
  TextEditingController passwordC = TextEditingController(text: "123123");

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
