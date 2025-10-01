import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF663E98);
  static const Color primaryPurpleButton = Color(0xFF7F4BF7);

  static const Color lightPurple = Color(0xFFB794F6);
  static const Color pinkPurple = Color(0xFFE879F9);
  static const Color darkPurple = Color(0xFF553C9A);

  static const Color splashBackground = Color(0xFFF5F5F7);
  static const Color backgroundGray = Color(0xFFE5E7EB);
  static const Color lightGray = Color(0xFFF9FAFB);
  static const Color mediumGray = Color(0xFF9CA3AF);
  static const Color darkGray = Color(0xFF374151);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  static const Color surface = Color(
    0xFFF9FAFB,
  ); // Input backgrounds, card surfaces
  static const Color outline = Color(0xFFE5E7EB); // Borders, dividers
  static const Color onSurfaceVariant = Color(
    0xFF6B7280,
  ); // Secondary text, hints
  static const Color primary = Color(0xFF7C3AED); // Links, accents
  static const Color onSurface = Color(0xFF263238); // Primary text, prices
  static const Color surfaceVariant = Color(
    0xFF6B7280,
  ); // Subtitles, descriptions  // Gradient definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryPurple, lightPurple, pinkPurple],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryPurple, backgroundGray],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [white, lightGray],
  );

  static TextStyle splashPoweredByText(double screenWidth) => TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 10.58,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: mediumGray,
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle splashBrandText(double screenWidth) => TextStyle(
    fontSize: 20.36,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: darkGray,
    height: 1.0,
    letterSpacing: 0,
  );

  // Register screen text styles
  static final TextStyle registerLoginTitle = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: primaryPurple,
    height: 1.3,
    letterSpacing: -0.01, // -1% letter spacing
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    //register,premium subtitle
    fontSize: 14,
    fontWeight: FontWeight.w300, // 300 is "Light" weight
    fontStyle: FontStyle.normal, // Normal font style
    color: Color.fromRGBO(0, 0, 0, 1),
    height: 1.25, // 125% line height
    letterSpacing: 0, // 0% letter spacing
  );

  static TextStyle inputLabel = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400, // 400 is Regular
    fontStyle: FontStyle.normal, // Regular style
    color: Color.fromRGBO(0, 0, 0, 1),
    height: 1.25, // 125% line height
    letterSpacing: 0, // 0% letter spacing
  );

  // Register screen interactive text styles
  static TextStyle linkText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium weight
    fontStyle: FontStyle.normal,
    color: Color(0xFF7F4BF7),
    height: 1.25, // 125% line height
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );

  static TextStyle loginLinkText = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi Bold
    fontStyle: FontStyle.normal,
    color: black,
    height: 1.25, // 125% line height
    letterSpacing: 0,
    // vertical-align and leading-trim are not available in Flutter TextStyle
  );

  static  TextStyle buttonText = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: 0,
  );

  static TextStyle footerText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: onSurfaceVariant,
    letterSpacing: 0,
  );

  // Form field text styles
  static  TextStyle inputText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xff000080),
    letterSpacing: 0,
  );

  static TextStyle inputHint = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: onSurfaceVariant,
    letterSpacing: 0,
  );

  static  TextStyle inputError = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: error,
    letterSpacing: 0,
  );

  // Reusable text styles for any screen
  static TextStyle titleLargeStyle = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: primaryPurple,
    height: 1.2,
  );
  static TextStyle titleMediumStyle = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w600, // SemiBold
    color: Color(0xFF663E98),
    height: 1.3, // 130% line height
    letterSpacing: -0.01, // -1% letter spacing
  );

  static TextStyle subtitleStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: Color(0xFF263238),
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle cardTitleStyle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static TextStyle priceStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600, // SemiBold
    color: onSurface,
    height: 1.25, // 125% line height
    letterSpacing: 0, // 0% letter spacing
  );

  static TextStyle durationStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    fontStyle: FontStyle.normal,
    color: onSurface,
    height: 1.25, // 125% line height
    letterSpacing: 0, // 0% letter spacing
  );

  static TextStyle captionStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    fontStyle: FontStyle.normal,
    color: Color(0xFF8696BB),
    height: 1.25, // 125% line height
    letterSpacing: 0, // 0% letter spacing
  );

  static TextStyle bodyTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium weight
    fontStyle: FontStyle.normal,
    color: Color(0xFF6E6E6E),
    height: 1.25, // 125% line height
    letterSpacing: 0,
  );

 
static TextStyle buttonTextStyle = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w600, // Semi Bold
  fontStyle: FontStyle.normal,
  color: white,
  height: 1.25, // 125% line height
  letterSpacing: 0,
  // textAlign and verticalAlign are set in the widget, not TextStyle
);


 

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: darkGray,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: darkGray,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: primaryPurple,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: darkGray,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: darkGray,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: darkGray,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: darkGray,
  );

  static const TextStyle subtitleLarge = TextStyle(
    fontSize: 16,
    color: Colors.white70,
    letterSpacing: 1,
  );

  static const TextStyle subtitleSmall = TextStyle(
    fontSize: 12,
    color: Colors.white54,
    letterSpacing: 1,
  );

  static const TextStyle brandText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: 1.5,
  );

  // Button styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryPurple,
    foregroundColor: white,
    elevation: 4,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: buttonText,
  );

  static final ButtonStyle registerButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryPurpleButton,
    foregroundColor: white,
    elevation: 0,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: buttonText,
  );

 
  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryPurpleButton,
    side: const BorderSide(color: primaryPurpleButton, width: 2),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: buttonText,
  );

  // Card styles
  static const BoxDecoration cardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.all(Radius.circular(16)),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
    ],
  );

  static const BoxDecoration elevatedCardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(color: Colors.black26, blurRadius: 16, offset: Offset(0, 8)),
    ],
  );

  // App logo container decoration
  static const BoxDecoration logoContainerDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    boxShadow: [
      BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10)),
    ],
  );

  // Input decoration theme
  static final InputDecorationThemeData inputDecorationTheme =
      InputDecorationThemeData(
        filled: true,
        fillColor: lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      );

  // Reusable input decoration
  static InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
    bool isOutlined = false,
  }) {
    if (isOutlined) {
      return InputDecoration(
        filled: true,
        fillColor: surface,
        hintText: hintText,
        hintStyle: inputHint,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: outline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: error, width: 2),
        ),
        errorStyle: inputError,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      );
    }

    return InputDecoration(
      filled: true,
      fillColor: lightGray,
      hintText: hintText,
      hintStyle: inputHint,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryPurple, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  // App bar theme
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: primaryPurple,
    foregroundColor: white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  );

  // Main theme data
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyle),
      inputDecorationTheme: inputDecorationTheme,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      ),
    );
  }

  // Dark theme (for future use)
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      appBarTheme: appBarTheme.copyWith(backgroundColor: darkGray),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyle),
      fontFamily: 'Roboto',
    );
  }

  // Spacing constants
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border radius constants
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration animationExtraSlow = Duration(milliseconds: 800);
}
