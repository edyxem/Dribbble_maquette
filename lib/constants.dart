import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Palette de couleurs extraite de la maquette Dribbble
class AppColors {
  AppColors._();

  static const Color background = Color(0xFFE8ECF1); // bleu-gris clair
  static const Color darkGreen = Color(0xFF1B3A2D);  // texte principal
  static const Color lime = Color(0xFFCCFF57);        // accent jaune-vert
  static const Color limeLight = Color(0xFFE8FF85);  // badge highlight
  static const Color white = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF8A9A90);  // sous-titres
  static const Color surface = Color(0xFFF5F8F5);    // fond carte
  static const Color depositColor = Color(0xFF4CAF7D);
  static const Color withdrawalColor = Color(0xFFFF6B6B);
  static const Color waveNavy = Color(0xFF2D3F50);   // blob foncé
  static const Color waveGreen = Color(0xFF4A8A5A);  // blob vert
  static const Color divider = Color(0xFFF0F0F0);
}

/// Styles typographiques (DM Serif Display + DM Sans via google_fonts)
class AppTextStyles {
  AppTextStyles._();

  /// Grands montants — police serif display
  static TextStyle displayLarge = GoogleFonts.dmSerifDisplay(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
    letterSpacing: -1.0,
    height: 1.1,
  );

  static TextStyle displayMedium = GoogleFonts.dmSerifDisplay(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
    letterSpacing: -0.5,
  );

  static TextStyle displaySmall = GoogleFonts.dmSerifDisplay(
    fontSize: 52,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
    letterSpacing: -1.0,
  );

  /// Corps de texte — sans-serif
  static TextStyle body = GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
  );

  static TextStyle bodyMedium = GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreen,
  );

  static TextStyle label = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle sectionTitle = GoogleFonts.dmSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
  );

  static TextStyle greeting = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
  );

  static TextStyle button = GoogleFonts.dmSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
    letterSpacing: 0.2,
  );

  static TextStyle amountPositive = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
  );

  static TextStyle amountNegative = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.withdrawalColor,
  );
}

/// Constantes de dimensions
class AppDim {
  AppDim._();

  static const double paddingH = 24.0;
  static const double paddingV = 16.0;
  static const double radiusFull = 100.0;
  static const double radiusCard = 20.0;
  static const double radiusBtn = 14.0;
  static const double avatarSize = 34.0;
  static const double navHeight = 72.0;
}
