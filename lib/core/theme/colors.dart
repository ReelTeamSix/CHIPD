import 'package:flutter/material.dart';

/// CHIP'D Color System
/// Based on the CHIP'D Style Guidelines
///
/// Primary Palette (90% of Usage):
/// - Cyber Green (brandGreen): #00FF94 - CTAs, verified badges, accents, highlights, success states
/// - Deepest Black (brandDark): #050505 - Backgrounds, primary surfaces
/// - Pure White: #FFFFFF - Headlines, primary text on dark backgrounds
///
/// Secondary Palette (10% of Usage):
/// - Accent Gray: #1A1A1A - Cards, elevated backgrounds, subtle separators
/// - Text Gray: #A0A0A0 - Descriptive text, labels, timestamps, metadata
/// - Error Red: #FF3B3B - Disputes, violations, error messages
///
/// Gold Palette (The 900 ONLY):
/// - Metallic Gold: #D4AF37 - ONLY for The 900 branding, founder tier elements, premium badges
class ChipdColors {
  ChipdColors._();

  // Primary Palette
  static const Color brandGreen = Color(0xFF00FF94);
  static const Color brandGreenDark = Color(0xFF00CC76);
  static const Color brandDark = Color(0xFF050505);
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Secondary Palette
  static const Color accentGray = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFFA0A0A0);
  static const Color errorRed = Color(0xFFFF3B3B);

  // The 900 Gold Palette (Exclusive Tier Only)
  static const Color brandGold = Color(0xFFD4AF37);
  static const Color brandGoldDark = Color(0xFFAA8A26);

  // Border colors
  static const Color borderLight = Color(0x1AFFFFFF); // rgba(255,255,255,0.1)
  static const Color borderMedium = Color(0x33FFFFFF); // rgba(255,255,255,0.2)
  static const Color borderGreenHover = Color(0x8000FF94); // rgba(0,255,148,0.5)

  // Surface overlays
  static const Color surfaceOverlay = Color(0x0DFFFFFF); // rgba(255,255,255,0.05)
  static const Color surfaceHover = Color(0x1AFFFFFF); // rgba(255,255,255,0.1)
}

class ApparenceKitColors extends ThemeExtension<ApparenceKitColors> {
  final Color primary;
  final Color primaryDark;
  final Color onPrimary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color gold;
  final Color goldDark;

  const ApparenceKitColors({
    required this.primary,
    required this.primaryDark,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.gold,
    required this.goldDark,
  });

  /// Light theme - Not the primary CHIP'D experience
  /// CHIP'D is a dark-first app, but light mode provided for accessibility
  factory ApparenceKitColors.light() => const ApparenceKitColors(
        primary: ChipdColors.brandGreen,
        primaryDark: ChipdColors.brandGreenDark,
        onPrimary: ChipdColors.brandDark,
        background: ChipdColors.pureWhite,
        onBackground: ChipdColors.brandDark,
        surface: Color(0xFFFAFAFA),
        onSurface: ChipdColors.brandDark,
        error: ChipdColors.errorRed,
        grey1: ChipdColors.accentGray,
        grey2: ChipdColors.textGray,
        grey3: Color(0xFFBEC1C3),
        gold: ChipdColors.brandGold,
        goldDark: ChipdColors.brandGoldDark,
      );

  /// Dark theme - The primary CHIP'D experience
  /// This is the core aesthetic: Black background, Cyber Green accents
  factory ApparenceKitColors.dark() => const ApparenceKitColors(
        primary: ChipdColors.brandGreen,
        primaryDark: ChipdColors.brandGreenDark,
        onPrimary: ChipdColors.brandDark,
        background: ChipdColors.brandDark,
        onBackground: ChipdColors.pureWhite,
        surface: ChipdColors.accentGray,
        onSurface: ChipdColors.pureWhite,
        error: ChipdColors.errorRed,
        grey1: ChipdColors.accentGray,
        grey2: ChipdColors.textGray,
        grey3: Color(0xFFBEC1C3),
        gold: ChipdColors.brandGold,
        goldDark: ChipdColors.brandGoldDark,
      );

  @override
  ThemeExtension<ApparenceKitColors> copyWith({
    Color? primary,
    Color? primaryDark,
    Color? onPrimary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? gold,
    Color? goldDark,
  }) {
    return ApparenceKitColors(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
      gold: gold ?? this.gold,
      goldDark: goldDark ?? this.goldDark,
    );
  }

  @override
  ThemeExtension<ApparenceKitColors> lerp(
    covariant ThemeExtension<ApparenceKitColors>? other,
    double t,
  ) {
    if (other == null || other is! ApparenceKitColors) return this;
    return ApparenceKitColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      goldDark: Color.lerp(goldDark, other.goldDark, t)!,
    );
  }
}
