
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_page/controllers/profile_controller.dart';
import 'package:login_page/gen/assets.gen.dart';
import 'package:login_page/screens/qr/generate_qrcode.dart';
import 'package:login_page/screens/qr/scan_qrcode.dart';
import 'package:login_page/utils/route_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Neeramoy Colors
  static const Color primaryColor = Color(0xFF178C83);
  static const Color darkTeal = Color(0xFF086B65);
  static const Color backgroundColor = Color(0xFFF7FAFA);
  static const Color textColor = Color(0xFF222222);
  static const Color secondaryText = Color(0xFF6D7B89);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: backgroundColor,

          // APP BAR
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            titleSpacing: 18,
            title: Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Assets.images.login.neeramoyGreen.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Profile',
                      style: TextStyle(
                        color: darkTeal,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Better Health, Brighter Tomorrow',
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/settings',
                    arguments: 'Ahad',
                  );
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  color: textColor,
                  size: 27,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),

          // BODY
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
              child: Column(
                children: [
                  _buildProfileHeader(),

                  const SizedBox(height: 15),

                  _buildTabs(controller),

                  const SizedBox(height: 17),

                  _buildInformationCards(),

                  const SizedBox(height: 17),

                  _buildQRCard(context),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // BOTTOM NAVIGATION
          bottomNavigationBar: _buildBottomNavigation(context),
        );
      },
    );
  }

  // PROFILE HEADER
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF087B72),
            Color(0xFF36A99D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: [
          Container(
            height: 88,
            width: 88,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              backgroundColor: Color(0xFFEAF5F4),
              child: Icon(
                Icons.person,
                size: 55,
                color: Color(0xFF6F9995),
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Safa',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      height: 19,
                      width: 19,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: primaryColor,
                        size: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                const Text(
                  'safa2517@student.nstu.edu.bd',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 9),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Patient',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.90),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // TODO: Add Edit Profile navigation.
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: darkTeal,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // PERSONAL / MEDICAL / LIFESTYLE TABS
  Widget _buildTabs(ProfileController controller) {
    final List<Map<String, dynamic>> tabs = [
      {
        'title': 'Personal',
        'icon': Icons.person_outline,
      },
      {
        'title': 'Medical',
        'icon': Icons.favorite_border,
      },
      {
        'title': 'Lifestyle',
        'icon': Icons.eco_outlined,
      },
    ];

    return Container(
      height: 62,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E6E7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final bool selected = controller.selectedTab == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                controller.changeTab(index);
              },
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tabs[index]['icon'] as IconData,
                      size: 21,
                      color: const Color(0xFF444444),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        tabs[index]['title'] as String,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // INFORMATION CARDS
  Widget _buildInformationCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _infoCard(
                icon: Icons.person_outline,
                title: 'Name',
                value: 'Safa',
                iconColor: const Color(0xFF178C83),
                iconBg: const Color(0xFFE2F4F1),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _infoCard(
                icon: Icons.female,
                title: 'Gender',
                value: 'Female',
                iconColor: const Color(0xFFE24B54),
                iconBg: const Color(0xFFFFE7E9),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _infoCard(
                icon: Icons.calendar_month_outlined,
                title: 'Date of Birth',
                value: '17/11/2002',
                iconColor: const Color(0xFF6253C8),
                iconBg: const Color(0xFFEDEAFF),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _infoCard(
                icon: Icons.phone_outlined,
                title: 'Contact',
                value: '+8801977918807',
                iconColor: const Color(0xFF178C83),
                iconBg: const Color(0xFFE2F4F1),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _infoCard(
                icon: Icons.location_on_outlined,
                title: 'Address',
                value: 'Chittagong',
                iconColor: const Color(0xFF1874C4),
                iconBg: const Color(0xFFE4F0FF),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _infoCard(
                icon: Icons.height,
                title: 'Height',
                value: '-',
                iconColor: const Color(0xFF1874C4),
                iconBg: const Color(0xFFE4F0FF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _infoCard(
                icon: Icons.fitness_center_outlined,
                title: 'Weight',
                value: '-',
                iconColor: const Color(0xFFD87925),
                iconBg: const Color(0xFFFFEDDD),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _infoCard(
                icon: Icons.water_drop_outlined,
                title: 'Blood Group',
                value: '-',
                iconColor: const Color(0xFFE64B54),
                iconBg: const Color(0xFFFFE6E8),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        _infoCard(
          icon: Icons.speed_outlined,
          title: 'BMI',
          value: '-',
          iconColor: const Color(0xFF178C83),
          iconBg: const Color(0xFFE2F4F1),
          fullWidth: true,
        ),
      ],
    );
  }

  // SINGLE INFORMATION CARD
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
    required Color iconBg,
    bool fullWidth = false,
  }) {
    return Container(
      height: 118,
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 9,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 25,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF9AA8B3),
            size: 24,
          ),
        ],
      ),
    );
  }

  // QR CARD
  Widget _buildQRCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE4F6F3),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.qr_code_2_rounded,
              color: darkTeal,
              size: 42,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scan Your QR Code',
                  style: TextStyle(
                    color: darkTeal,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Quick access to your medical information',
                  maxLines: 2,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 7),

          ElevatedButton.icon(
            onPressed: () => _showQRDialog(context),
            style: ButtonStyle(
              backgroundColor:
                  const WidgetStatePropertyAll(primaryColor),
              foregroundColor:
                  const WidgetStatePropertyAll(Colors.white),
              elevation: const WidgetStatePropertyAll(0),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              size: 20,
            ),
            label: const Text(
              'Scan QR',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomItem(
            icon: Icons.home_outlined,
            label: 'Home',
            selected: false,
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                RouteHelper.home,
              );
            },
          ),

          _bottomItem(
            icon: Icons.search_rounded,
            label: 'Search',
            selected: false,
            onTap: () {
              // TODO: Add Search screen navigation.
            },
          ),

          _bottomItem(
            icon: Icons.medical_services_outlined,
            label: 'Doctors',
            selected: false,
            onTap: () {
              // TODO: Add Doctors screen navigation.
            },
          ),

          _bottomItem(
            icon: Icons.calendar_month_outlined,
            label: 'Book',
            selected: false,
            onTap: () {
              // TODO: Add Book screen navigation.
            },
          ),

          _bottomItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            selected: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION ITEM
  Widget _bottomItem({
    required IconData icon,
    required String label,
    required bool selected,
    VoidCallback? onTap,
  }) {
    return SizedBox(
      width: 65,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 27,
              color: selected
                  ? primaryColor
                  : const Color(0xFF8D9AA5),
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: selected
                    ? primaryColor
                    : const Color(0xFF8D9AA5),
              ),
            ),

            const SizedBox(height: 4),

            Container(
              height: 3,
              width: selected ? 34 : 0,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // QR DIALOG
  void _showQRDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE4F6F3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.qr_code_2_rounded,
                    color: darkTeal,
                    size: 42,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'QR Code',
                  style: TextStyle(
                    color: darkTeal,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'Choose an option',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 22),

                // GENERATE QR CODE
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(dialogContext);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const GenerateQRCodeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(
                      Icons.qr_code_2_rounded,
                      size: 23,
                    ),
                    label: const Text(
                      'Generate QR Code',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // SCAN QR CODE
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(dialogContext);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const ScanQRCodeScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: const BorderSide(
                        color: primaryColor,
                        width: 1.3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 23,
                    ),
                    label: const Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // CANCEL
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
