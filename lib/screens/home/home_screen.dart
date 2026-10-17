
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_page/controllers/home_controller.dart';
import 'package:login_page/gen/assets.gen.dart';
import 'package:login_page/screens/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ThemeData থেকে colors নেওয়া হচ্ছে।
  Color _primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  Color _textDark(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  Color _textMuted(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  Color _cardColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  Color _borderColor(BuildContext context) =>
      Theme.of(context).colorScheme.outlineVariant;

  Color _gold(BuildContext context) =>
      const Color(0xFFD99436);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainServicesGrid(context),
            const SizedBox(height: 20),

            _buildSectionHeader(
              context,
              'Premium Health Offers',
              onViewAll: () {},
            ),
            const SizedBox(height: 10),
            _buildOffersSection(context),
            const SizedBox(height: 20),

            _buildLiveDoctorHeader(context),
            const SizedBox(height: 10),
            _buildDoctorsSection(context),
            const SizedBox(height: 20),

            _buildDiscountBanner(context),
            const SizedBox(height: 20),

            _buildSectionHeader(
              context,
              "Partner's Services",
              onViewAll: () {},
            ),
            const SizedBox(height: 10),
            _buildPartnerServices(context),
            const SizedBox(height: 20),

            _buildAppointmentsSection(context),
            const SizedBox(height: 20),

            _buildSectionHeader(
              context,
              'Neeramoy Health Tools',
              onViewAll: () {},
            ),
            const SizedBox(height: 10),
            _buildHealthTools(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // Local assets এবং network images দুটোই support করবে।
  Widget _buildImage(
    BuildContext context,
    String path, {
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    final placeholder = Container(
      height: height,
      width: width,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: _textMuted(context),
      ),
    );

    if (path.startsWith('http://') ||
        path.startsWith('https://')) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => placeholder,
      );
    }

    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (_, __, ___) => placeholder,
    );
  }

  // AppBar
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _cardColor(context),
      foregroundColor: _textDark(context),
      elevation: 0.5,
      titleSpacing: 14,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _primary(context).withValues(alpha:0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.local_hospital_rounded,
              color: _primary(context),
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Safa',
            style: TextStyle(
              color: _textDark(context),
              fontSize: 19,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none_rounded,
            color: _textDark(context),
            size: 24,
          ),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 14),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
            ),
          ),
        ),
      ],
    );
  }

  // Reusable section header
  Widget _buildSectionHeader(
    BuildContext context,
    String title, {
    required VoidCallback onViewAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: _textDark(context),
              letterSpacing: -0.2,
            ),
          ),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: Text(
            'View all >',
            style: TextStyle(
              color: _textMuted(context),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // Main services grid
  Widget _buildMainServicesGrid(BuildContext context) {
    final services = [
      {
        'title': '24/7 Live Doctor',
        'image': Assets.images.home.liveDoctor.path,
      },
      {
        'title': 'Mental Health Support',
        'image': Assets.images.home.mentalHealth.path,
      },
      {
        'title': 'Specialist App...',
        'image': Assets.images.home.specialist.path,
      },
      {
        'title': 'Medicines',
        'image': Assets.images.home.medicine.path,
      },
      {
        'title': 'Lab Tests',
        'image': Assets.images.home.labTest.path,
      },
      {
        'title': 'Physiotherapy',
        'image': Assets.images.home.physiotherapy.path,
      },
      {
        'title': 'Caregiver',
        'image': Assets.images.home.careGiver.path,
      },
      {
        'title': 'Emergency',
        'image': Assets.images.home.emergency.path,
      },
      {
        'title': 'More Services',
        'image':
            'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?w=300',
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.92,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final item = services[index];

        return Container(
          decoration: BoxDecoration(
            color: _cardColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _borderColor(context),
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(11),
                  ),
                  child: _buildImage(
                    context,
                    item['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 4,
                ),
                child: Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: _textDark(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Premium Health Offers
  Widget _buildOffersSection(BuildContext context) {
    final offers = [
      {
        'title': 'Master Card',
        'subtitle': '8 Benefits',
        'logo': Assets.images.home.masterCard.path,
      },
      {
        'title': 'BRAC Bank',
        'subtitle': '9 Benefits',
        'logo': Assets.images.home.bracBank.path,
      },
      {
        'title': 'Standard Chartered',
        'subtitle': '9 Benefits',
        'logo': Assets.images.home.standardChartered.path,
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];

              return Container(
                width: 128,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: _cardColor(context),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _borderColor(context),
                    width: 0.8,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImage(
                      context,
                      offer['logo']!,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      offer['title']!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        color: _textDark(context),
                      ),
                    ),
                    Text(
                      offer['subtitle']!,
                      style: TextStyle(
                        color: _textMuted(context),
                        fontSize: 9.5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: index == 1 ? 8 : 5,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == 1
                    ? _primary(context)
                    : _borderColor(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Live Doctor heading
  Widget _buildLiveDoctorHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '24/7 Live Doctor',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _textDark(context),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.sensors_rounded,
              color: Color(0xFFEF4444),
              size: 16,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'View all >',
            style: TextStyle(
              color: _textMuted(context),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // Doctor cards
  Widget _buildDoctorsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDoctorCard(
            context,
            name: 'Dr. A Nahian Ah...',
            specialty: 'General Physician',
            price: '450.0 TK',
            imageUrl:
                'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=300',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildDoctorCard(
            context,
            name: 'Dr. Rufaidah Tas...',
            specialty: 'General Physician',
            price: '450.0 TK',
            imageUrl: Assets.images.home.rufaida.path,
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard(
    BuildContext context, {
    required String name,
    required String specialty,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _cardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _borderColor(context),
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildImage(
                  context,
                  imageUrl,
                  height: 95,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 11.5,
              color: _textDark(context),
            ),
          ),
          Text(
            specialty,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _textMuted(context),
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: _textDark(context),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _gold(context),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Consult Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Medicine discount banner
  Widget _buildDiscountBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: _primary(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text(
                      'মেডিসিন ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '১০%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'অর্ডার করুন\nবাসায় বসেই',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10.5,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBannerLabel('Lazz Pharma Limited'),
              const SizedBox(height: 4),
              _buildBannerLabel('Aster PHARMACY'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBannerLabel(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 8,
          color: Color(0xFF0F6B5C),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // Partner services
  Widget _buildPartnerServices(BuildContext context) {
    final partners = [
      {
        'name': 'Moner Jotno',
        'img':
            'https://images.unsplash.com/photo-1544027993-37dbfe43562a?w=150',
      },
      {
        'name': 'BRAC Health Solutions',
        'img':
            'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?w=150',
      },
      {
        'name': 'Mother Care',
        'img':
            'https://images.unsplash.com/photo-1531983412531-1f49a365ffed?w=150',
      },
      {
        'name': 'Cancer Care',
        'img':
            'https://images.unsplash.com/photo-1579154204601-01588f351e67?w=150',
      },
    ];

    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final item = partners[index];

          return Container(
            width: 102,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _cardColor(context),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _borderColor(context),
                width: 0.8,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: _buildImage(
                    context,
                    item['img']!,
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['name']!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                    color: _textDark(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Appointments
  Widget _buildAppointmentsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 110,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _primary(context).withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: _primary(context),
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  'You Have 0\nUpcoming Appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9.5,
                    color: _textMuted(context),
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              _buildActionTile(
                context,
                Icons.assignment_outlined,
                'Prescription',
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildActionTile(
                      context,
                      Icons.medical_information_outlined,
                      'Diag. ...',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionTile(
                      context,
                      Icons.groups_outlined,
                      'Family ...',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: _cardColor(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _borderColor(context),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: _primary(context), size: 16),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: _textDark(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Health tools
  Widget _buildHealthTools(BuildContext context) {
    return Row(
      children: [
        _buildToolCard(
          context,
          'BMI\nCalculator',
          Icons.calculate_outlined,
          const Color(0xFFF59E0B),
        ),
        const SizedBox(width: 10),
        _buildToolCard(
          context,
          'Due Date\nCalculator',
          Icons.child_care_outlined,
          const Color(0xFFEC4899),
        ),
        const SizedBox(width: 10),
        _buildToolCard(
          context,
          'Symptom\nChecker',
          Icons.health_and_safety_outlined,
          _primary(context),
        ),
      ],
    );
  }

  Widget _buildToolCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 6,
        ),
        decoration: BoxDecoration(
          color: _cardColor(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _borderColor(context),
            width: 0.8,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w600,
                color: _textDark(context),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom navigation using GetBuilder.
  Widget _buildBottomNavBar(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          selectedItemColor: _primary(context),
          unselectedItemColor: _textMuted(context),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          backgroundColor: _cardColor(context),
          elevation: 8,
          onTap: (index) {
            if (index == 4) {
              Get.to(() => const ProfileScreen());
            } else {
              controller.changeTabIndex(index);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
