import 'package:get/get.dart';
import 'package:login_page/screens/home/home_screen.dart';
import 'package:login_page/screens/login/login_screens.dart';
import 'package:login_page/screens/profile/profile_screen.dart';
import 'package:login_page/screens/settings/settings_screen.dart';
import 'package:login_page/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String home = '/';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String settings = '/settings';


  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
    ),
   
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
    ),
  ];
}