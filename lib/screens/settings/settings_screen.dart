
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const Color primary = Color(0xFF087D78);
  static const Color teal = Color(0xFF138C84);
  static const Color background = Color(0xFFF5FBF9);
  static const Color textDark = Color(0xFF16434A);
  static const Color textGrey = Color(0xFF78909C);

  void _showInfo(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: primary),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmAction(
    BuildContext context, {
    required String title,
    required String message,
    required String action,
    required Color color,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(dialogContext);

              // Connect this action to your authentication
              // or account-management service.
              _showInfo(
                context,
                'Action required',
                '$action needs to be connected to your account service.',
              );
            },
            child: Text(action),
          ),
        ],
      ),
    );
  }

void _changePassword(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  Get.dialog(
    GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return AlertDialog(
          title: const Text('Change Password'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controller.currentController,
                    obscureText: controller.obscureCurrent,
                    decoration: InputDecoration(
                      labelText: 'Current password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleCurrentPassword,
                        icon: Icon(
                          controller.obscureCurrent
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your current password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  TextFormField(
                    controller: controller.newController,
                    obscureText: controller.obscureNew,
                    decoration: InputDecoration(
                      labelText: 'New password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleNewPassword,
                        icon: Icon(
                          controller.obscureNew
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Use at least 6 characters';
                      }

                      if (value == controller.currentController.text) {
                        return 'New password must be different';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  TextFormField(
                    controller: controller.confirmController,
                    obscureText: controller.obscureConfirm,
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPassword,
                        icon: Icon(
                          controller.obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != controller.newController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: Get.back,
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.back();

                  _showInfo(
                    context,
                    'Validation successful',
                    'Connect your password update API to save the new password.',
                  );
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    ),
    barrierDismissible: false,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 20, 18),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE1F7F2),
                    Color(0xFFF5FBF9),
                  ],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.monitor_heart_outlined,
                    size: 37,
                    color: Color(0xFF8BD4CA),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.medical_services_outlined,
                    size: 34,
                    color: teal,
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('General'),
                    const SizedBox(height: 14),

                    // General options
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFDDEEEB),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: teal.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _generalTile(
                            icon: Icons.info_outline_rounded,
                            title: 'About Us',
                            subtitle: 'Learn more about Neeramoy',
                            onTap: () => _showInfo(
                              context,
                              'About Neeramoy',
                              'Neeramoy is your healthcare companion.',
                            ),
                          ),
                          _divider(),
                          _generalTile(
                            icon: Icons.description_outlined,
                            title: 'Terms & Conditions',
                            subtitle: 'Terms of use and service',
                            onTap: () => _showInfo(
                              context,
                              'Terms & Conditions',
                              'Connect your official terms and conditions page here.',
                            ),
                          ),
                          _divider(),
                          _generalTile(
                            icon: Icons.health_and_safety_outlined,
                            title: 'Refund and Cancellation Policy',
                            subtitle: 'Know our refund and cancellation policy',
                            onTap: () => _showInfo(
                              context,
                              'Refund Policy',
                              'Connect your official refund and cancellation policy here.',
                            ),
                          ),
                          _divider(),
                          _generalTile(
                            icon: Icons.lock_outline_rounded,
                            title: 'Privacy Policy',
                            subtitle: 'Your privacy is important to us',
                            onTap: () => _showInfo(
                              context,
                              'Privacy Policy',
                              'Connect your official privacy policy here.',
                            ),
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Offers section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle('Offers'),
                        TextButton(
                          onPressed: () => _showInfo(
                            context,
                            'All Offers',
                            'Connect the available offers page here.',
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      height: 185,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _offerCard(
                            title: 'Master Card',
                            benefits: '8 Benefits',
                            logo: 'mastercard',
                            colors: const [
                              Color(0xFFFFFCF3),
                              Color(0xFFFFF4D9),
                            ],
                            onTap: () => _showInfo(
                              context,
                              'Master Card Offers',
                              'Connect the verified Mastercard benefits and eligibility details.',
                            ),
                          ),
                          _offerCard(
                            title: 'BRAC Bank',
                            benefits: '9 Benefits',
                            logo: 'BRAC BANK',
                            colors: const [
                              Color(0xFFF0F8FF),
                              Color(0xFFDDEFFF),
                            ],
                            onTap: () => _showInfo(
                              context,
                              'BRAC Bank Offers',
                              'Connect the verified BRAC Bank benefits and eligibility details.',
                            ),
                          ),
                          _offerCard(
                            title: 'Standard Chartered',
                            benefits: '9 Benefits',
                            logo: 'SCB',
                            colors: const [
                              Color(0xFFF1FFF7),
                              Color(0xFFE0F7E9),
                            ],
                            onTap: () => _showInfo(
                              context,
                              'Standard Chartered Offers',
                              'Connect the verified bank benefits and eligibility details.',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    _sectionTitle('Account'),
                    const SizedBox(height: 16),

                    // Change password
                    _accountTile(
                      icon: Icons.lock_outline_rounded,
                      title: 'Change password',
                      subtitle: 'Keep your account secure',
                      backgroundColor: const Color(0xFFE7F8F4),
                      iconBackground: const Color(0xFFCFF0E9),
                      iconColor: primary,
                      onTap: () => _changePassword(context),
                    ),

                    const SizedBox(height: 14),

                    // Logout
                    _accountTile(
                      icon: Icons.logout_rounded,
                      title: 'Logout',
                      subtitle: 'Sign out from your account',
                      backgroundColor: const Color(0xFFEDF8FF),
                      iconBackground: const Color(0xFFD8F0FF),
                      iconColor: const Color(0xFF168CC2),
                      onTap: () => _confirmAction(
                        context,
                        title: 'Logout',
                        message: 'Are you sure you want to log out?',
                        action: 'Logout',
                        color: const Color(0xFF168CC2),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Delete account
                    _accountTile(
                      icon: Icons.delete_outline_rounded,
                      title: 'Delete Account',
                      subtitle: 'Permanently delete your account',
                      backgroundColor: const Color(0xFFFFEBEB),
                      iconBackground: const Color(0xFFFFD8D8),
                      iconColor: const Color(0xFFD94A4A),
                      onTap: () => _confirmAction(
                        context,
                        title: 'Delete Account',
                        message:
                            'Are you sure? Account deletion may permanently remove your data.',
                        action: 'Delete',
                        color: const Color(0xFFD94A4A),
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Footer
                    const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.monitor_heart_outlined,
                            size: 45,
                            color: Color(0xFF70C9BE),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Neeramoy',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: primary,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Your Health • Our Priority',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 1,
                              color: textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      indent: 26,
      endIndent: 26,
      color: Color(0xFFE1EFED),
    );
  }

  Widget _generalTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFDDF6F1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(
                icon,
                size: 29,
                color: primary,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: primary,
              size: 27,
            ),
          ],
        ),
      ),
    );
  }

  Widget _offerCard({
    required String title,
    required String benefits,
    required String logo,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 205,
        margin: const EdgeInsets.only(right: 12, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: primary.withOpacity(0.10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: logo == 'mastercard'
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _MastercardMark(),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'mastercard',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      )
                    : logo == 'BRAC BANK'
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF075CA8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'BRAC BANK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_balance,
                                color: Color(0xFF138C84),
                                size: 30,
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  'standard\nchartered',
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: textDark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      benefits,
                      style: const TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: primary,
                  size: 23,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _accountTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color iconBackground,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: iconColor.withOpacity(0.15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: primary,
                size: 27,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MastercardMark extends StatelessWidget {
  const _MastercardMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 27,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFFEB001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: const Color(0xFFF79E1B).withOpacity(0.95),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
