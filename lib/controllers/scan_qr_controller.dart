
import 'dart:convert';
import 'dart:js_interop';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

@JS('window.decodeQrImage')
external JSPromise _decodeQrImage(String dataUrl);

class ScanQRController extends GetxController {
  String qrResult = 'Choose an option to scan a QR code.';
  String? imageDataUrl;

  bool isLoading = false;
  bool showCamera = false;
  bool hasScanned = false;

  final MobileScannerController cameraController =
      MobileScannerController(
    autoStart: false,
    formats: const [BarcodeFormat.qrCode],
  );

  // Camera scanning শুরু
  Future<void> openCameraScanner() async {
    if (isLoading || isClosed) return;

    showCamera = true;
    hasScanned = false;
    imageDataUrl = null;
    qrResult = 'Point your camera at a QR code.';
    update();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isClosed || !showCamera) return;

      try {
        await cameraController.start();
      } catch (e) {
        if (isClosed) return;

        showCamera = false;
        qrResult =
            'Camera unavailable. Allow camera permission or upload a QR image.';
        update();
      }
    });
  }

 
  Future<void> uploadAndScanImage(BuildContext context) async {
    if (isLoading || isClosed) return;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (isClosed || result == null || result.files.isEmpty) return;

      final pickedFile = result.files.first;
      final bytes = pickedFile.bytes;

      if (isClosed || bytes == null) return;

      isLoading = true;
      showCamera = false;
      hasScanned = false;
      imageDataUrl = null;
      qrResult = 'Reading image...';
      update();

      await cameraController.stop();

      if (isClosed) return;

      final base64String = base64Encode(bytes);
      final dataUrl = 'data:image/png;base64,$base64String';

      final Object? decoded =
          await _decodeQrImage(dataUrl).toDart;

      final String? decodedText = decoded?.toString();

      if (isClosed) return;

      imageDataUrl = dataUrl;

      qrResult = (decodedText != null && decodedText.isNotEmpty)
          ? decodedText
          : 'No QR code found. Please select a clearer image.';

      update();

      if (decodedText != null && decodedText.isNotEmpty) {
        await showLinkOptionsIfNeeded(decodedText, context);
      }
    } catch (e) {
      if (isClosed) return;

      qrResult = 'Could not scan image: $e';
      update();
    } finally {
      if (!isClosed) {
        isLoading = false;
        update();
      }
    }
  }

  // Camera থেকে QR detect
  void handleCameraDetection(
    BarcodeCapture capture,
    BuildContext context,
  ) {
    if (hasScanned || isClosed) return;

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;

      if (value != null && value.isNotEmpty) {
        hasScanned = true;
        qrResult = value;
        update();

        cameraController.stop();
        showLinkOptionsIfNeeded(value, context);
        break;
      }
    }
  }

  // Resultটি web link কি না
  bool isWebLink(String value) {
    final uri = Uri.tryParse(value.trim());

    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  // Link হলে Copy / Open অপশন দেখাবে
  Future<void> showLinkOptionsIfNeeded(
    String value,
    BuildContext context,
  ) async {
    if (!isWebLink(value) || !context.mounted || isClosed) {
      return;
    }

    final action = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'How would you like to open this link?',
          ),
          content: SelectableText(value),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, 'cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, 'copy'),
              child: const Text('Copy Link'),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, 'open'),
              child: const Text('Open in Browser'),
            ),
          ],
        );
      },
    );

    if (!context.mounted ||
        isClosed ||
        action == null ||
        action == 'cancel') {
      return;
    }

    if (action == 'copy') {
      await Clipboard.setData(
        ClipboardData(text: value),
      );

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Link copied to clipboard.'),
        ),
      );
      return;
    }

    if (action == 'open') {
      final launched = await launchUrl(
        Uri.parse(value),
        mode: LaunchMode.externalApplication,
      );

      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open this link.'),
          ),
        );
      }
    }
  }

  // Camera বন্ধ
  Future<void> closeCamera() async {
    await cameraController.stop();

    if (isClosed) return;

    showCamera = false;
    qrResult = 'Camera scanner closed.';
    update();
  }

  // Scan result copy
  Future<void> copyResult(BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(text: qrResult),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('QR result copied to clipboard.'),
      ),
    );
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
