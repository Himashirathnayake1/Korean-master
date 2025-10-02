import 'package:flutter/material.dart';
import 'package:korean_master/themes/app_theme.dart';

class PopupCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const PopupCustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final button = SizedBox(
      height: 56,
      width:198,
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            style ??
            ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPurpleButton,
              foregroundColor: AppTheme.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: AppTheme.buttonTextStyle,
            ),
        child: Text(text, style: AppTheme.buttonTextStyle),
      ),
    );

    return button;
  }
}
