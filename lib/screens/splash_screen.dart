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
          AppTheme.splashBackground, 
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1, 
            vertical: screenHeight * 0.05, 
          ),
          child: Column(
            children: [
              Spacer(flex: 2), // Top spacer
              Center(
                child: Container(
                  width: 160,
                  height: 160,
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

              SvgPicture.asset(
                'assets/images/Korean Master.svg',
                width:
                    screenWidth *
                    0.5, 
              ),

              // Bottom spacer
              SizedBox(height: 230),

       
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

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
