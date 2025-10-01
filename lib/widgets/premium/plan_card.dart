import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String duration;
  final String price;
  final String access;
  final bool isSelected;
  final bool isPremium;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.duration,
    required this.price,
    required this.access,
    required this.isSelected,
    required this.isPremium,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 0.9, 
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? AppTheme.primaryPurple : AppTheme.outline,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.outline.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                transform: Matrix4.translationValues(0, -15, 0),
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurpleButton,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Plan details
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        duration,
                        style: AppTheme.subtitleStyle,

                      ),
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  price.contains('+')
                                      ? price.split(' + ')[0] // "LKR 8"
                                      : price, // Full price for premium
                              style: AppTheme.subtitleStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (price.contains('+')) ...[
                            TextSpan(
                              text: ' + ',
                              style: AppTheme.subtitleStyle.copyWith(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                              TextSpan(
                                text: price.split(' + ')[1], // "Tax"
                                 style: AppTheme.subtitleStyle.copyWith(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        access,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          height: 1.25,
                          letterSpacing: 0,
                          color: Color(0xFF8696BB),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
