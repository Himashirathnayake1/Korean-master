import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/screens/register_screen.dart';
import 'package:korean_master/themes/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 6), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          AppTheme.splashBackground, // Light gray background like the image
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1, // 10% padding on sides
            vertical: screenHeight * 0.05, // 5% padding top/bottom
          ),
          child: Column(
            children: [
              Spacer(flex: 2), // Top spacer to center content vertically
              // App Logo Container - matching the white card in image
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: AppTheme.splashLogoDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/images/App Logo.png',
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Spacer between logo and title
              SizedBox(height: 37), // 8% of screen height
              // Korean Master Title - Using the single SVG file
              SvgPicture.asset(
                'assets/images/Korean Master.svg',
                width:
                    screenWidth *
                    0.7, // 70% of screen width for better visibility
                fit: BoxFit.contain,
              ),

              // Bottom spacer
              const Spacer(flex: 3),

              // Powered by section at bottom
              Column(
                children: [
                  Text(
                    'powered by',
                    style: AppTheme.splashPoweredByText(screenWidth),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    'ideacipher',
                    style: AppTheme.splashBrandText(screenWidth),
                  ),
                ],
              ),

              // Bottom padding
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
