
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../controllers/scan_qr_controller.dart';

class ScanQRCodeScreen extends StatelessWidget {
  const ScanQRCodeScreen({super.key});

  static const Color primary = Color(0xFF0F6B5C);
  static const Color background = Color(0xFFF6F8FA);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanQRController>(
      init: ScanQRController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            title: const Text(
              'Scan QR Code',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            backgroundColor: primary,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),

                // Header card
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFD7E9E3),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 68,
                        color: primary,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'QR Code Scanner',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primary,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Scan a QR code with your camera or choose an image from your computer.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // Camera button
                ElevatedButton.icon(
                  onPressed: controller.isLoading
                      ? null
                      : controller.openCameraScanner,
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Scan with Camera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Upload button
                OutlinedButton.icon(
                  onPressed: controller.isLoading
                      ? null
                      : () => controller.uploadAndScanImage(context),
                  icon: const Icon(Icons.upload_file_rounded),
                  label: const Text('Upload QR Image'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: const BorderSide(color: primary),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // Camera preview
                if (controller.showCamera) ...[
                  const SizedBox(height: 22),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 300,
                      child: MobileScanner(
                        controller: controller.cameraController,
                        onDetect: (capture) {
                          controller.handleCameraDetection(
                            capture,
                            context,
                          );
                        },
                        errorBuilder: (context, error) {
                          return const ColoredBox(
                            color: Color(0xFFEAF3F0),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Camera unavailable. Check browser permissions or upload an image.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton.icon(
                      onPressed: controller.closeCamera,
                      icon: const Icon(Icons.close),
                      label: const Text('Close Camera'),
                      style: TextButton.styleFrom(
                        foregroundColor: primary,
                      ),
                    ),
                  ),
                ],

                // Uploaded image preview
                if (controller.imageDataUrl != null) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      controller.imageDataUrl!,
                      height: 180,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Image preview unavailable.',
                        );
                      },
                    ),
                  ),
                ],

                const SizedBox(height: 22),

                // Scanned result card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F7F5),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFD7E9E3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: primary,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Scanned Result',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                            ),
                          ),
                          IconButton(
                            tooltip: 'Copy result',
                            onPressed: controller.isLoading
                                ? null
                                : () => controller.copyResult(context),
                            icon: const Icon(
                              Icons.copy_rounded,
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (controller.isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              color: primary,
                            ),
                          ),
                        )
                      else
                        SelectableText(
                          controller.qrResult,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
