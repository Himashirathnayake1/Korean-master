import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';
import 'package:korean_master/widgets/common/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({Key? key, required this.phoneNumber})
    : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<String> _otpDigits = ['', '', '', '', ''];
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  int _currentDigitIndex = 0;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    // Collect all entered digits
    final enteredOtp =
        _controllers.map((controller) => controller.text).toList();

    // Check if all digits are filled
    if (!enteredOtp.contains('')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Verification successful!')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter all digits')));
    }
  }

  // Resend code logic
  void _resendCode() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Verification code resent')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Title
           Text(
                'Verify your phone number',
                style: AppTheme.registerLoginTitle,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              // Subtitle with phone number
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTheme.inputLabel,
                  children: [
                    const TextSpan(
                      text:
                          'We\'ve sent an SMS with an activation code to your phone ',
                    ),
                    TextSpan(
                      text: widget.phoneNumber,
                      style: AppTheme.inputLabel.copyWith(color: Colors.black,fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) => _buildOtpDigitBox(index)),
              ),

              const SizedBox(height: 40),

              // "I didn't receive a code" and Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                    'I didn\'t receive a code',
                    style: AppTheme.inputLabel,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _resendCode,
                    child: Text(
                      'Resend',
                      style: AppTheme.inputLabel.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: CustomButton(onPressed: _verifyOtp, text: 'Verify'),
              ),

              const Spacer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Build a single OTP digit box
  Widget _buildOtpDigitBox(int index) {
    final bool isActive = index == _currentDigitIndex;
    final bool isFilled = _otpDigits[index].isNotEmpty;

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              isFilled
                  ? Colors.grey.shade400
                  : isActive
                  ? AppTheme.primaryPurple
                  : Colors.grey.shade300,
          width: isActive ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        showCursor: true,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _otpDigits[index] = value;
              // Move to next field if available
              if (index < _otpDigits.length - 1) {
                _currentDigitIndex = index + 1;
                // Focus next field
                FocusScope.of(context).nextFocus();
              } else {
                // Close keyboard on last digit
                FocusScope.of(context).unfocus();
              }
            });
          } else {
            setState(() {
              _otpDigits[index] = '';
            });
          }
        },
        onTap: () {
          setState(() {
            _currentDigitIndex = index;
          });
        },
        controller: _controllers[index],
      ),
    );
  }
}
