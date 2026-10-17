
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/utils/route_helper.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void clearEmail() {
    emailController.clear();
    update();
  }

  Future<void> login() async {
    if (isLoading) return;

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isLoading = true;
    update();

    try {
      // Demo loading delay; real authentication is not connected yet.
      await Future.delayed(const Duration(seconds: 2));

      if (isClosed) return;

      isLoading = false;
      update();

      Get.offNamed(RouteHelper.home);
    } catch (e) {
      if (!isClosed) {
        isLoading = false;
        update();
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
