import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:korean_master/screens/eps_topik_screen.dart';
import 'package:korean_master/themes/app_theme.dart';
import 'package:korean_master/widgets/eps_topik/book_selection_popup.dart';
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
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
  int _currentDigitIndex = 0;
  bool _showError = false;

  final List<String> _validOtp = ['1', '2', '3', '4', '5'];

  @override
  void initState() {
    super.initState();

    // Request focus on first field when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNodes.isNotEmpty) {
        _focusNodes[0].requestFocus();
      }
    });

    // Set up listeners for each text field
    for (int i = 0; i < _controllers.length; i++) {
      final int index = i;

      // Add focus listeners to detect backspace on empty fields
      _focusNodes[index].addListener(() {
        // When this field gets focus, update the current index
        if (_focusNodes[index].hasFocus) {
          setState(() {
            _currentDigitIndex = index;
          });
        }
      });

      // Track the last value to detect backspace
      String lastValue = _controllers[index].text;

      _controllers[index].addListener(() {
        final String currentValue = _controllers[index].text;

        // If text was deleted and field is now empty (backspace was pressed)
        if (lastValue.isNotEmpty && currentValue.isEmpty) {
          if (index > 0) {
            // Move to previous field
            setState(() {
              _currentDigitIndex = index - 1;
            });
            _focusNodes[index - 1].requestFocus();
          }
        }

        // Update last value for next comparison
        lastValue = currentValue;
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    // Collect all entered digits
    final enteredOtp =
        _controllers.map((controller) => controller.text).toList();

    // Check if all digits are filled
    if (!enteredOtp.contains('')) {
      // Verify against valid OTP
      bool isCorrect = true;
      for (int i = 0; i < _validOtp.length; i++) {
        if (enteredOtp[i] != _validOtp[i]) {
          isCorrect = false;
          break;
        }
      }

      if (isCorrect) {
        setState(() {
          _showError = false;
        });
        Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder:
                          (context) => EpsTopikScreen(selectedBook: 'EPS Book 01'),
                    ),
                  );

        // Show the book selection popup first
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (BuildContext context) => BookSelectionPopup(
                onBookSelected: (bookId) {
                  // Close the popup
                  Navigator.of(context).pop();

                  // Determine book title based on bookId
                  String bookTitle =
                      bookId == 'book01' ? 'EPS Book 01' : 'EPS Book 02';

                  // Navigate to EPS Topik screen with selected book
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder:
                          (context) => EpsTopikScreen(selectedBook: bookTitle),
                    ),
                  );
                },
              ),
        );
      } else {
        setState(() {
          _showError = true;
        });
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter all digits')));
    }
  }

  // Resend code logic
  void _resendCode() {
    // Reset error state
    setState(() {
      _showError = false;
      // Clear all fields
      for (int i = 0; i < _controllers.length; i++) {
        _controllers[i].clear();
        _otpDigits[i] = '';
      }
      // Focus on first field
      _currentDigitIndex = 0;
      _focusNodes[0].requestFocus();
    });

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
                      style: AppTheme.inputLabel.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
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

              // Error message
              if (_showError)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Wrong code, please try again',
                    style: AppTheme.inputError,
                  ),
                ),

              SizedBox(height: _showError ? 20 : 40),

              // "I didn't receive a code" and Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I didn\'t receive a code', style: AppTheme.inputLabel),
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

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          // Show red border when there's an error, otherwise regular styling
          color:
              _showError
                  ? Colors.red[400]!
                  : isActive
                  ? AppTheme
                      .primaryPurple // Purple when active/selected
                  : Colors.grey.shade300, // Grey when inactive
          width: isActive ? 1.0 : 1.0, // Thicker border when active
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction:
            index < _otpDigits.length - 1
                ? TextInputAction.next
                : TextInputAction.done,
        maxLength: 1,
        autofocus: index == 0,
        showCursor: true,
        focusNode: _focusNodes[index],
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        enableInteractiveSelection: false, // Disable text selection
        onChanged: (value) {
          // Update state
          setState(() {
            _otpDigits[index] = value;

            // Reset error state when user types
            if (_showError) {
              _showError = false;
            }

            // When a digit is entered (exactly 1 character)
            if (value.length == 1) {
              // Move to next field if not the last one
              if (index < _otpDigits.length - 1) {
                _currentDigitIndex = index + 1;
                _focusNodes[index + 1].requestFocus();
              }
              // We removed the code that hides keyboard on last field
              // so the keyboard will remain visible
            }
          });
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
