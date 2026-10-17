
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateQRController extends GetxController {
  final TextEditingController urlController = TextEditingController();

  String qrData = '';

  void generateQRCode() {
    final input = urlController.text.trim();

    if (input.isEmpty) {
      Get.snackbar(
        'Input Required',
        'Please enter a URL or text.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    qrData = input;
    update();
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }
}
