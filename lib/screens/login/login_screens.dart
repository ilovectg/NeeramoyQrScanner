
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:login_page/controllers/login_controller.dart';
import 'package:login_page/gen/assets.gen.dart';
import 'package:login_page/theme/theme_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    final Color currentTextColor = isDark
        ? ThemeController.textLight
        : ThemeController.textDark;

    final Color currentGreyColor = isDark
        ? Colors.white70
        : ThemeController.greyColor;

    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              // Desktop view
              if (constraints.maxWidth >= 1024) {
                return _buildDesktopOrTabletScaffold(
                  context,
                  controller,
                  isDark,
                  currentTextColor,
                  currentGreyColor,
                  maxWidth: 480,
                  isDesktop: true,
                );
              }

              // Tablet view
              if (constraints.maxWidth >= 600) {
                return _buildDesktopOrTabletScaffold(
                  context,
                  controller,
                  isDark,
                  currentTextColor,
                  currentGreyColor,
                  maxWidth: 420,
                  isDesktop: false,
                );
              }

              // Mobile view
              return _buildMobileScaffold(
                context,
                controller,
                isDark,
                currentTextColor,
                currentGreyColor,
              );
            },
          ),
        );
      },
    );
  }

  // ================= MOBILE VIEW =================

  Widget _buildMobileScaffold(
    BuildContext context,
    LoginController controller,
    bool isDark,
    Color currentTextColor,
    Color currentGreyColor,
  ) {
    return Form(
      key: controller.formKey,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Stack(
              children: [
                Assets.images.login.neeramoyLogin.image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                if (isDark)
                  Container(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
              ],
            ),
          ),

          // Decorative circle
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF4F8D84)
                    .withValues(alpha: 0.47),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Login form
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: _buildLoginFormContent(
                context,
                controller,
                isDark,
                currentTextColor,
                currentGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= DESKTOP & TABLET VIEW =================

  Widget _buildDesktopOrTabletScaffold(
    BuildContext context,
    LoginController controller,
    bool isDark,
    Color currentTextColor,
    Color currentGreyColor, {
    required double maxWidth,
    required bool isDesktop,
  }) {
    return Form(
      key: controller.formKey,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Stack(
              children: [
                Assets.images.login.neeramoyLogin.image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                if (isDark)
                  Container(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
              ],
            ),
          ),

          // Centered login card
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.75)
                        : Colors.white.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: isDesktop ? 0.15 : 0.08,
                        ),
                        blurRadius: isDesktop ? 25 : 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: _buildLoginFormContent(
                    context,
                    controller,
                    isDark,
                    currentTextColor,
                    currentGreyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= COMMON LOGIN FORM =================

  Widget _buildLoginFormContent(
    BuildContext context,
    LoginController controller,
    bool isDark,
    Color currentTextColor,
    Color currentGreyColor,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            Assets.images.login.neeramoylogo2.path,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 12),

        // App name
        const Text(
          'Neeramoy',
          style: TextStyle(
            color: ThemeController.primaryColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Your Health, Our Priority',
          style: TextStyle(
            color: currentGreyColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 20),

        // Welcome message
        const Text(
          'Welcome Back',
          style: TextStyle(
            color: ThemeController.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          'Log in to continue your health journey',
          style: TextStyle(
            color: currentGreyColor,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 25),

        // ================= EMAIL FIELD =================

        TextFormField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: currentTextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : Colors.white.withValues(alpha: 0.90),
            prefixIcon: Icon(
              Icons.email,
              color: currentTextColor,
            ),
            suffixIcon: IconButton(
              onPressed: controller.clearEmail,
              icon: Icon(
                Icons.clear,
                color: currentTextColor,
              ),
            ),
            labelText: 'Enter your email',
            labelStyle: TextStyle(
              color: currentTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ThemeController.primaryColor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ThemeController.primaryColor,
                width: 3,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your email';
            }

            if (!EmailValidator.validate(value.trim())) {
              return 'Please enter valid email';
            }

            return null;
          },
        ),

        const SizedBox(height: 15),

        // ================= PASSWORD FIELD =================

        TextFormField(
          controller: controller.passwordController,
          obscureText: !controller.isPasswordVisible,
          obscuringCharacter: '*',
          style: TextStyle(
            color: currentTextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : Colors.white.withValues(alpha: 0.90),
            prefixIcon: Icon(
              Icons.lock,
              color: currentTextColor,
            ),
            suffixIcon: IconButton(
              onPressed: controller.togglePasswordVisibility,
              icon: Icon(
                controller.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: currentTextColor,
              ),
            ),
            labelText: 'Enter your password',
            labelStyle: TextStyle(
              color: currentTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ThemeController.primaryColor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ThemeController.primaryColor,
                width: 3,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }

            return null;
          },
        ),

        // ================= FORGOT PASSWORD =================

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: ThemeController.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= LOGIN BUTTON =================

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.isLoading
                ? null
                : controller.login,
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeController.primaryColor,
              disabledBackgroundColor:
                  ThemeController.primaryColor.withValues(alpha: 0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: controller.isLoading
                ? const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 25,
                  )
                : const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),

        const SizedBox(height: 15),

        // ================= DIVIDER =================

        Row(
          children: [
            Expanded(
              child: Divider(
                color: currentGreyColor,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or',
                style: TextStyle(
                  color: currentGreyColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: currentGreyColor,
                thickness: 1,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        // ================= OTP BUTTON =================

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: ThemeController.primaryColor,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'Continue with OTP',
              style: TextStyle(
                color: ThemeController.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        // ================= SIGN UP =================

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: currentGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: ThemeController.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
