
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
 
  static const Color primaryColor = Color(0xFF095A51);
  static const Color secondaryColor = Color(0xFF4F8D84);

  static const Color backgroundColor = Color(0xFFF6F8FA);
  static const Color cardColor = Color(0xFFFFFFFF);

  static const Color textDark = Color(0xFF1E293B);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF64748B);

  static const Color greyColor = Color(0xFF757979);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE2E8F0);

  static const Color successColor = Color(0xFF16A34A);
  static const Color errorColor = Color(0xFFDC2626);
  static const Color warningColor = Color(0xFFD99436);


  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textDark,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textDark,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 14,
    color: textDark,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 12,
    color: textMuted,
  );

  

  ThemeMode currentThemeMode = ThemeMode.light;

  bool get isDarkMode =>
      currentThemeMode == ThemeMode.dark;


  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,

      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: cardColor,
        foregroundColor: textDark,
        elevation: 0,
        centerTitle: false,
      ),

      cardTheme: const CardThemeData(
        color: cardColor,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      dividerColor: borderColor,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        hintStyle: const TextStyle(
          color: textMuted,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }


  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: ColorScheme.fromSeed(
        seedColor: secondaryColor,
        brightness: Brightness.dark,
      ),

      scaffoldBackgroundColor: const Color(0xFF121212),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: textLight,
        elevation: 0,
      ),

      cardTheme: const CardThemeData(
        color: Color(0xFF1E1E1E),
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      dividerColor: const Color(0xFF383838),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        hintStyle: const TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }


  void toggleTheme() {
    currentThemeMode = isDarkMode
        ? ThemeMode.light
        : ThemeMode.dark;

    update();
  }

  void setLightTheme() {
    currentThemeMode = ThemeMode.light;
    update();
  }

  void setDarkTheme() {
    currentThemeMode = ThemeMode.dark;
    update();
  }

  void setSystemTheme() {
    currentThemeMode = ThemeMode.system;
    update();
  }
}
