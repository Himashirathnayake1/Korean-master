// Example: How to use the AppTheme in your Korean Master app
// This file demonstrates various ways to use the centralized theme

import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

class ThemeUsageExample extends StatelessWidget {
  const ThemeUsageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Usage Examples'),
        backgroundColor: AppTheme.primaryPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using theme colors
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppTheme.radiusM),
                ),
              ),
              child: Center(
                child: Text(
                  'Primary Gradient Background',
                  style: AppTheme.titleLarge.copyWith(color: AppTheme.white),
                ),
              ),
            ),

            SizedBox(height: AppTheme.spacingL),

            // Using theme text styles
            Text('Headline Large', style: AppTheme.headlineLarge),
            SizedBox(height: AppTheme.spacingS),
            Text('Headline Medium', style: AppTheme.headlineMedium),
            SizedBox(height: AppTheme.spacingS),
            Text('Title Large', style: AppTheme.titleLarge),
            SizedBox(height: AppTheme.spacingS),
            Text('Body Large', style: AppTheme.bodyLarge),
            SizedBox(height: AppTheme.spacingS),
            Text('Body Medium', style: AppTheme.bodyMedium),

            SizedBox(height: AppTheme.spacingL),

            // Using theme button styles
            Row(
              children: [
                ElevatedButton(
                  style: AppTheme.primaryButtonStyle,
                  onPressed: () {},
                  child: const Text('Primary Button'),
                ),
                SizedBox(width: AppTheme.spacingM),
                ElevatedButton(
                  style: AppTheme.secondaryButtonStyle,
                  onPressed: () {},
                  child: const Text('Secondary Button'),
                ),
              ],
            ),

            SizedBox(height: AppTheme.spacingM),

            OutlinedButton(
              style: AppTheme.outlinedButtonStyle,
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),

            SizedBox(height: AppTheme.spacingL),

            // Using theme card decorations
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: AppTheme.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Regular Card', style: AppTheme.titleMedium),
                  SizedBox(height: AppTheme.spacingS),
                  Text(
                    'This is a card with regular elevation',
                    style: AppTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppTheme.spacingM),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: AppTheme.elevatedCardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elevated Card', style: AppTheme.titleMedium),
                  SizedBox(height: AppTheme.spacingS),
                  Text(
                    'This is a card with higher elevation',
                    style: AppTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppTheme.spacingL),

            // Using theme input decoration
            TextFormField(
              decoration: AppTheme.inputDecoration.copyWith(
                labelText: 'Enter Korean word',
                hintText: 'e.g., 안녕하세요',
              ),
            ),

            SizedBox(height: AppTheme.spacingM),

            TextFormField(
              decoration: AppTheme.inputDecoration.copyWith(
                labelText: 'Translation',
                hintText: 'e.g., Hello',
                prefixIcon: const Icon(Icons.translate),
              ),
            ),

            SizedBox(height: AppTheme.spacingL),

            // Color palette showcase
            Text('Color Palette', style: AppTheme.titleLarge),
            SizedBox(height: AppTheme.spacingM),

            Wrap(
              spacing: AppTheme.spacingS,
              runSpacing: AppTheme.spacingS,
              children: [
                _colorBox('Primary Purple', AppTheme.primaryPurple),
                _colorBox('Light Purple', AppTheme.lightPurple),
                _colorBox('Pink Purple', AppTheme.pinkPurple),
                _colorBox('Dark Purple', AppTheme.darkPurple),
                _colorBox('Success', AppTheme.success),
                _colorBox('Warning', AppTheme.warning),
                _colorBox('Error', AppTheme.error),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(String name, Color color) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppTheme.radiusS),
      ),
      child: Center(
        child: Text(
          name,
          style: AppTheme.bodySmall.copyWith(
            color: AppTheme.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
