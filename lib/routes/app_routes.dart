import 'package:flutter/material.dart';
import 'package:korean_master/screens/premium_screen.dart';
import 'package:korean_master/screens/register_screen.dart';
import 'package:korean_master/screens/splash_screen.dart';
class AppRoutes {
  static const String splashScreen = '/splash';
  static const String registerScreen = '/register';
  static const String premiumScreen = '/premium';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    registerScreen: (context) => const RegisterScreen(),
    premiumScreen: (context) => const PremiumScreen(),
  };
}

  