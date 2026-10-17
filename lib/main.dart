
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_page/theme/theme_controller.dart';
import 'package:login_page/utils/route_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Neeramoy',

          theme: themeController.lightTheme,
          darkTheme: themeController.darkTheme,
          themeMode: themeController.currentThemeMode,

          initialRoute: RouteHelper.splash,
          getPages: RouteHelper.routes,
        );
      },
    );
  }
}
