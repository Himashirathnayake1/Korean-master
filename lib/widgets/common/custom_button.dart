import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isFullWidth = true,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: style ?? AppTheme.registerButtonStyle,
      child: Text(text, style: AppTheme.buttonTextStyle),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
