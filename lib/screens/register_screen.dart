import 'package:flutter/material.dart';
import 'package:korean_master/screens/premium_screen.dart';
import 'package:korean_master/themes/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isPhoneVisible = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _togglePhoneVisibility() {
    setState(() {
      _isPhoneVisible = !_isPhoneVisible;
    });
  }

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      // Handle registration logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
          backgroundColor: AppTheme.success,
        ),
      );
    }
  }

  void _onLogin() {
    // Navigate to login screen
    Navigator.of(context).pop(); // Or navigate to login screen
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, // 6% padding on sides
            vertical: screenHeight * 0.04, // 4% padding top/bottom
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),

                // Title Section
                const Text(
                  'Register for\nDaily Access',
                  style: AppTheme.registerTitle,
                ),

                SizedBox(height: screenHeight * 0.015),

                // Subtitle with More details link
                RichText(
                  text: TextSpan(
                    style: AppTheme.registerSubtitle,
                    children: [
                      const TextSpan(
                        text:
                            'Get started for just LKR 8 + tax/day.\nCancel anytime. ',
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            // Handle "More details>" tap
                          },
                          child: const Text(
                            'More details>',
                            style: AppTheme.linkText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Name Field
                const Text('Name', style: AppTheme.inputLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  style: AppTheme.inputText,
                  decoration: AppTheme.inputDecoration(
                    hintText: 'Your name',
                    isOutlined: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.trim().length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.025),

                // Phone Number Field
                const Text('Phone number', style: AppTheme.inputLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  obscureText: !_isPhoneVisible,
                  style: AppTheme.inputText,
                  decoration: AppTheme.inputDecoration(
                    hintText: '07X XXX XXXX',
                    isOutlined: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPhoneVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppTheme.onSurfaceVariant,
                        size: 20,
                      ),
                      onPressed: _togglePhoneVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // Basic Sri Lankan phone number validation
                    final phoneRegex = RegExp(r'^0[0-9]{9}$');
                    if (!phoneRegex.hasMatch(value.replaceAll(' ', ''))) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.04),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _onRegister();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PremiumScreen(),
                        ),
                      );
                    },
                    style: AppTheme.registerButtonStyle,
                    child: const Text('Register', style: AppTheme.buttonText),
                  ),
                ),

                // Spacer to push footer to bottom
                SizedBox(height: screenHeight * 0.27),

                // Footer
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTheme.footerText,
                      children: [
                        const TextSpan(text: 'Already purchased Lifetime?? '),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: _onLogin,
                            child: const Text(
                              'Login',
                              style: AppTheme.loginLinkText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
