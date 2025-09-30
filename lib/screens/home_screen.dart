import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Korean Master',
          style: AppTheme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: AppTheme.primaryPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, size: 80, color: AppTheme.white),
                SizedBox(height: AppTheme.spacingL),
                Text(
                  'Welcome to Korean Master!',
                  style: AppTheme.headlineMedium.copyWith(
                    color: AppTheme.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppTheme.spacingS),
                Text(
                  'Start your Korean learning journey',
                  style: AppTheme.subtitleLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
