
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  void toggleCurrentPassword() {
    obscureCurrent = !obscureCurrent;
    update();
  }

  void toggleNewPassword() {
    obscureNew = !obscureNew;
    update();
  }

  void toggleConfirmPassword() {
    obscureConfirm = !obscureConfirm;
    update();
  }

  void resetPasswordVisibility() {
    obscureCurrent = true;
    obscureNew = true;
    obscureConfirm = true;
    update();
  }

  @override
  void onClose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}
