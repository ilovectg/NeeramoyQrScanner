
import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:login_page/utils/route_helper.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;

  Timer? _navigationTimer;

  @override
  void onInit() {
    super.onInit();

    // Logo animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    scaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutBack,
      ),
    );

    animationController.forward();

    // 5 seconds later, navigate to Login
    _navigationTimer = Timer(
      const Duration(seconds: 5),
      () {
        if (!isClosed) {
          Get.offNamed(RouteHelper.login);
        }
      },
    );
  }

  @override
  void onClose() {
    _navigationTimer?.cancel();
    animationController.dispose();
    super.onClose();
  }
}
