import 'package:flutter/material.dart';

class TColors {
  // ! Basic Color
  static const Color primary = Color(0xFF4b68FF);
  static const Color secondary = Color(0xFFFFE23B);
  static const Color accent = Color(0xFFb0c7ff);

  // ! Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  // ! gradient color
  static Gradient linearGradient = const RadialGradient( colors: [
    Color(0xFFff9a9e),
    Color(0xFFfad0c4),
    Color(0xFFfad0c4),
  ]);

  // ! Backgroung Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // ! Background Container Color
  static const Color lightContainer = Color(0xFFF3F5FF);
  static Color darkContainer = TColors.textWhite.withOpacity(0.1);

  // ! Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // ! Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // ! Error and validation Color
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // ! Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFEDEDED);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
