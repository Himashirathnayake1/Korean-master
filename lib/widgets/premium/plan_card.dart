import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

// Abstract base class for plan cards
abstract class BasePlanCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const BasePlanCard({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  // Common card container
  Widget buildCardContainer({required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppTheme.primaryPurple : AppTheme.outline,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x14000000),
                blurRadius: 40,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  // Common title badge
  Widget buildTitleBadge(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      transform: Matrix4.translationValues(0, -20, 0),
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
    );
  }

  // Common access text
  Widget buildAccessText(String access) {
    return Text(
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
    );
  }
}

// Basic plan card implementation
class BasicPlanCard extends BasePlanCard {
  const BasicPlanCard({
    super.key,
    required bool isSelected,
    required VoidCallback onTap,
  }) : super(isSelected: isSelected, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return buildCardContainer(
      child: Column(
        children: [
          buildTitleBadge('Basic'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 2), 
                  Text('Daily', style: AppTheme.subtitleStyle),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'LKR 8',
                          style: AppTheme.subtitleStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' + ',
                          style: AppTheme.subtitleStyle.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Tax',
                          style: AppTheme.subtitleStyle.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),
                  buildAccessText('Limited access'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Premium plan card implementation
class PremiumPlanCard extends BasePlanCard {
  const PremiumPlanCard({
    super.key,
    required bool isSelected,
    required VoidCallback onTap,
  }) : super(isSelected: isSelected, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return buildCardContainer(
      child: Column(
        children: [
          buildTitleBadge('Premium'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16), // Add padding at the top
                  Text('Life time', style: AppTheme.subtitleStyle),
                  const SizedBox(height: 4),
                  Text(
                    'LKR 4500',
                    style: AppTheme.subtitleStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 13),
                  buildAccessText('Unlimited access'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Keeping the original PlanCard for backward compatibility
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
    if (isPremium) {
      return PremiumPlanCard(isSelected: isSelected, onTap: onTap);
    } else {
      return BasicPlanCard(isSelected: isSelected, onTap: onTap);
    }
  }
}
