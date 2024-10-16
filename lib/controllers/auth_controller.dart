import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (emailController.text == 'admin@test.com' &&
        passwordController.text == '123456') {
      Get.offNamed('/dashboard');
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
