
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_page/controllers/splash_controller.dart';
import 'package:login_page/gen/assets.gen.dart';
import 'package:login_page/theme/theme_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    final Color primaryColor = ThemeController.primaryColor;
    final Color tealColor = ThemeController.secondaryColor;

    final Color backgroundColor = isDark
        ? Theme.of(context).scaffoldBackgroundColor
        : const Color(0xFFF3FFFC);

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDark
                    ? [
                        backgroundColor,
                        const Color(0xFF152522),
                        const Color(0xFF10201E),
                      ]
                    : [
                        backgroundColor,
                        Colors.white,
                        const Color(0xFFE5F7F3),
                      ],
              ),
            ),
            child: Stack(
              children: [
                // Top teal decoration
                Positioned(
                  top: -80,
                  left: -70,
                  right: -70,
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: tealColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(180),
                      ),
                    ),
                  ),
                ),

                // Decorative plus icon
                Positioned(
                  top: 170,
                  left: 35,
                  child: Icon(
                    Icons.add,
                    size: 42,
                    color: tealColor.withValues(alpha: 0.45),
                  ),
                ),

                // Decorative heart
                Positioned(
                  top: 110,
                  right: 15,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 170,
                    color: tealColor.withValues(alpha: 0.12),
                  ),
                ),

                // Bottom teal decoration
                Positioned(
                  bottom: -100,
                  left: -80,
                  right: -80,
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      color: tealColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                      ),
                    ),
                  ),
                ),

                // Bottom plus icon
                Positioned(
                  bottom: 130,
                  right: 45,
                  child: Icon(
                    Icons.add,
                    size: 45,
                    color: tealColor.withValues(alpha: 0.55),
                  ),
                ),

                // Responsive content
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double width = constraints.maxWidth;
                    final double height = constraints.maxHeight;

                    final bool isCompact =
                        height < 680 || width < 360;

                    final double logoSize =
                        width.clamp(120.0, 155.0).toDouble();

                    final double loadingWidth =
                        (width - 40).clamp(180.0, 250.0).toDouble();

                    final double ecgWidth =
                        (width - 56).clamp(220.0, 270.0).toDouble();

                    return SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 24,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: height > 48 ? height - 48 : 0,
                          ),
                          child: Center(
                            child: FadeTransition(
                              opacity: controller.fadeAnimation,
                              child: ScaleTransition(
                                scale: controller.scaleAnimation,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Logo
                                    Container(
                                      width: logoSize,
                                      height: logoSize,
                                      padding: EdgeInsets.all(
                                        isCompact ? 12 : 15,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isDark
                                            ? const Color(0xFF263B37)
                                            : Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: tealColor.withValues(
                                              alpha: 0.15,
                                            ),
                                            blurRadius: 25,
                                            spreadRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Assets
                                          .images.login.redLogo
                                          .image(
                                        fit: BoxFit.contain,
                                      ),
                                    ),

                                    SizedBox(
                                      height: isCompact ? 14 : 22,
                                    ),

                                    // App name
                                    Text(
                                      'Neeramoy',
                                      style: TextStyle(
                                        fontSize: width
                                            .clamp(34.0, 44.0)
                                            .toDouble(),
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -1,
                                        color: primaryColor,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    // Tagline
                                    Text(
                                      'Your Health Journey Starts Here',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 1.2,
                                        color: isDark
                                            ? const Color(0xFF80CFC5)
                                            : const Color(0xFF348B85),
                                      ),
                                    ),

                                    SizedBox(
                                      height: isCompact ? 30 : 65,
                                    ),

                                    // ECG heartbeat animation
                                    ECGLine(
                                      width: ecgWidth,
                                      color: tealColor,
                                    ),

                                    SizedBox(
                                      height: isCompact ? 18 : 28,
                                    ),

                                    // Loading bar
                                    SizedBox(
                                      width: loadingWidth,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        child: LinearProgressIndicator(
                                          minHeight: 9,
                                          value: 0.65,
                                          backgroundColor: isDark
                                              ? const Color(0xFF35524D)
                                              : const Color(0xFFBFE5E0),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 13),

                                    // Loading text
                                    Text(
                                      'L O A D I N G . . .',
                                      style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 3,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ================= ECG HEARTBEAT ANIMATION =================

class ECGLine extends StatefulWidget {
  const ECGLine({
    required this.width,
    required this.color,
    super.key,
  });

  final double width;
  final Color color;

  @override
  State<ECGLine> createState() => _ECGLineState();
}

class _ECGLineState extends State<ECGLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 65,
      child: CustomPaint(
        painter: ECGPainter(
          _controller,
          widget.color,
        ),
      ),
    );
  }
}

class ECGPainter extends CustomPainter {
  ECGPainter(this.animation, this.color)
      : super(repaint: animation);

  final Animation<double> animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 270, size.height / 65);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 32)
      ..lineTo(55, 32)
      ..lineTo(70, 32)
      ..lineTo(82, 15)
      ..lineTo(96, 52)
      ..lineTo(112, 5)
      ..lineTo(128, 58)
      ..lineTo(143, 23)
      ..lineTo(158, 32)
      ..lineTo(270, 32);

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ECGPainter oldDelegate) {
    return oldDelegate.animation != animation ||
        oldDelegate.color != color;
  }
}
