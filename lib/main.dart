import 'package:flutter/material.dart';
import 'package:pro1_un/page/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

// ألوان التصنيفات كمتغيرات ثابتة
class CategoryColors {
  static const Color giftBg = Color(0xFFF6EEFD);
  static const Color giftIcon = Color(0xFFA677F9);

  static const Color fashionBg = Color(0xFFC7DEFF);
  static const Color fashionIcon = Color(0xFF338AFF);

  static const Color gadgetBg = Color(0xFFDEE7F1);
  static const Color gadgetIcon = Color(0xFF2E4771);

  static const Color watchBg = Color(0xFFFFF3E7);
  static const Color watchIcon = Color(0xFFFFD09D);

  static const Color accessBg = Color(0xFFC9ECE7);
  static const Color accessIcon = Color(0xFF147768);
}

// الثيم الأساسي للتطبيق
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF8204FF),
  scaffoldBackgroundColor: Colors.white,

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF8204FF),
    primary: const Color(0xFF8204FF),
    secondary: const Color(0xFFA677F9),
    surface: Colors.white,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    surfaceTintColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: Color(0xFF757575)),
    prefixIconColor: const Color(0xFF807F7F),
    suffixIconColor: const Color(0xFF807F7F),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Color(0xFF8204FF),
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.redAccent,
        width: 1.5,
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF8204FF),
      foregroundColor: Colors.white,
      disabledBackgroundColor: const Color(0xFFC9A5FF),
      elevation: 0,
      minimumSize: const Size(double.infinity, 54),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF8204FF),
      side: const BorderSide(color: Color(0xFF8204FF)),
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF8204FF),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Color(0xFF807F7F),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF807F7F),
      fontSize: 16,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      color: Color(0xFF9E9E9E),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocketShop',
      theme: appTheme,
      home: const OnboardingView(),
    );
  }
}