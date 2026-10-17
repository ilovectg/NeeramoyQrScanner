
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:login_page/controllers/generate_qr_controller.dart';

class GenerateQRCodeScreen extends StatelessWidget {
  const GenerateQRCodeScreen({super.key});

  static const Color primary = Color(0xFF0F6B5C);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateQRController>(
      init: GenerateQRController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Generate QR Code'),
            backgroundColor: primary,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.qrData.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: QrImageView(
                        data: controller.qrData,
                        version: QrVersions.auto,
                        size: 200,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'QR Code Generated Successfully!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      controller.qrData,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],

                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: controller.urlController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        hintText: 'Enter URL or text',
                        labelText: 'Enter URL or Text',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.link),
                      ),
                      onSubmitted: (_) => controller.generateQRCode(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: controller.generateQRCode,
                      icon: const Icon(Icons.qr_code),
                      label: const Text('Generate QR Code'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
