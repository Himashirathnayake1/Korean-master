import 'package:flutter/material.dart';
import 'package:korean_master/routes/app_routes.dart';
import 'package:korean_master/screens/splash_screen.dart';
import 'package:korean_master/screens/register_screen.dart';
import 'package:korean_master/screens/premium_screen.dart';
import 'package:korean_master/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korean Master',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
      //home: const SplashScreen(),
      // routes: {
      //   '/splash': (context) => const SplashScreen(),
      //   '/register': (context) => const RegisterScreen(),
      //   '/premium': (context) => const PremiumScreen(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
