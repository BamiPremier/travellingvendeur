import 'package:travellingVendeur/Views/ComplementView/OnboardingScreen.dart';
import 'package:travellingVendeur/Views/FirstScreen.dart';
import 'package:travellingVendeur/Views/ComplementView/SplashScreen.dart';
import 'package:travellingVendeur/Views/UsersMange/RegisterScreen.dart';
import 'package:travellingVendeur/Views/UsersMange/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:travellingVendeur/Views/UsersMange/LoginScreen.dart';
import 'package:travellingVendeur/Views/aboutUsScreen.dart';
import 'package:travellingVendeur/Views/HomeView/AcheterBillet.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.FIRST, page: () => FirstScreen()),
    GetPage(name: AppLinks.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppLinks.HOME, children: [], page: () => AcheterBillet()),
    GetPage(name: AppLinks.REGISTER, page: () => RegisterScreen()),
    GetPage(name: AppLinks.FORGOT, page: () => ForgotPassordScreen()),
    GetPage(name: AppLinks.ABOUTUS, page: () => AboutUsScreen()),
    GetPage(name: AppLinks.SPLASHSCREEN, page: () => SplashScreenPage()),
    GetPage(name: AppLinks.ONBOARDING, page: () => Onboarding()),
  ];
}

class AppLinks {
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String REGISTER = "/register";
  static const String ABOUTUS = "/aboutus";
  static const String FORGOT = "/forgot";
  static const String FIRST = "/first";
  static const String SPLASHSCREEN = "/splashscreen";
  static const String ONBOARDING = "/onboarding";
}
