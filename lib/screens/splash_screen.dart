import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/screens/home_screen.dart';
import 'package:korean_master/themes/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _titleController;
  late AnimationController _fadeController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<double> _generalFadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
    _navigateToHome();
  }

  void _initializeAnimations() {
    // Logo animations
    _logoController = AnimationController(
      duration: AppTheme.animationSlow,
      vsync: this,
    );

    // Title animations
    _titleController = AnimationController(
      duration: AppTheme.animationSlow,
      vsync: this,
    );

    // General fade controller
    _fadeController = AnimationController(
      duration: AppTheme.animationMedium,
      vsync: this,
    );

    // Logo animations
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    // Title animations
    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeOutCubic),
    );

    _titleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    // General fade animation
    _generalFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
  }

  void _startAnimationSequence() async {
    // Start logo animation
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();

    // Start title animation after logo
    await Future.delayed(const Duration(milliseconds: 600));
    _titleController.forward();

    // Start general fade for other elements
    await Future.delayed(const Duration(milliseconds: 200));
    _fadeController.forward();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) => const HomeScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOutCubic;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _titleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Main content area
              Expanded(
                flex: 8,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo with animation
                      AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _logoScaleAnimation.value,
                            child: FadeTransition(
                              opacity: _logoFadeAnimation,
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.radiusXXL,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    AppTheme.spacingS,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/App Logo.svg',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: AppTheme.spacingXXL),

                      // Korean Master Title with animation
                      SlideTransition(
                        position: _titleSlideAnimation,
                        child: FadeTransition(
                          opacity: _titleFadeAnimation,
                          child: SvgPicture.asset(
                            'assets/images/Korean Master.svg',
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(height: AppTheme.spacingL),

                      // Subtitle with animation
                      SlideTransition(
                        position: _titleSlideAnimation,
                        child: FadeTransition(
                          opacity: _titleFadeAnimation,
                          child: Text(
                            'Master Korean Language with Fun',
                            style: AppTheme.subtitleLarge.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom section with loading and branding
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Loading indicator
                    FadeTransition(
                      opacity: _generalFadeAnimation,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        ),
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.white.withOpacity(0.9),
                          ),
                          backgroundColor: AppTheme.white.withOpacity(0.3),
                        ),
                      ),
                    ),

                    // Branding section
                    FadeTransition(
                      opacity: _generalFadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'powered by',
                            style: AppTheme.subtitleSmall.copyWith(
                              fontSize: 11,
                              letterSpacing: 1.5,
                              color: AppTheme.white.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(height: AppTheme.spacingXS),
                          Text(
                            'ideacipher',
                            style: AppTheme.brandText.copyWith(
                              fontSize: 16,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
