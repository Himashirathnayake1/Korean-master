import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/screens/register_screen.dart';
import 'package:korean_master/themes/app_theme.dart';
import 'package:korean_master/widgets/premium/plan_card.dart';
import 'package:korean_master/widgets/common/custom_button.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool isBasicSelected = false;

  void _selectPlan(bool selectBasic) {
    setState(() {
      isBasicSelected = selectBasic;
    });
  }

  Widget _buildStatusIcon(bool isAvailable, {bool isLimited = false}) {
    if (!isAvailable) {
      return SvgPicture.asset(
        'assets/images/remove.svg',
        width: 20,
        height: 20,
      );
    }

    if (isLimited) {
      return Text('Limited', style: AppTheme.bodyTextStyle);
    }

    return SvgPicture.asset('assets/images/check.svg', width: 20, height: 20);
  }

  Widget _buildFeatureRow(
    String feature,
    bool basicAvailable,
    bool premiumAvailable, {
    bool isLimited = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              feature,
              style: AppTheme.subtitleStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: _buildStatusIcon(basicAvailable, isLimited: isLimited),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(child: _buildStatusIcon(premiumAvailable)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text('KoreanMaster Premium', style: AppTheme.titleMediumStyle),

              SizedBox(height: 6),

              // Subtitle
              Text(
                'Basic is just the beginning. Premium unlocks unlimited learning and the full experience.',
                style: AppTheme.subtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),

              SizedBox(height: 50),

              // Plan Cards
              Row(
                children: [
                  Expanded(
                    child: BasicPlanCard(
                      isSelected: isBasicSelected,
                      onTap: () => _selectPlan(true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PremiumPlanCard(
                      isSelected: !isBasicSelected,
                      onTap: () => _selectPlan(false),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              // Features Table Header
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFA19898), width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text('Features', style: AppTheme.bodyTextStyle),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Basic',
                        style: AppTheme.bodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Premium',
                        style: AppTheme.bodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Features List
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFDDDDDD), width: 1),
                  ),
                ),
                child: _buildFeatureRow(
                  'All Words',
                  true,
                  true,
                  isLimited: true,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.outline, width: 1),
                  ),
                ),
                child: _buildFeatureRow('Flashcards', false, true),
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.outline, width: 1),
                  ),
                ),
                child: _buildFeatureRow('Lifetime Access', false, true),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.outline, width: 1),
                  ),
                ),
                child: _buildFeatureRow('Progress Reset', false, true),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.outline, width: 1),
                  ),
                ),
                child: _buildFeatureRow('Ads-free Learning', false, true),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.outline, width: 1),
                  ),
                ),
                child: _buildFeatureRow('Backup & Sync', false, true),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Continue Button
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02),

              // Cancel text
              Center(
                child: Text(
                  'You can cancel your subscription anytime',
                  style: AppTheme.footerText,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
