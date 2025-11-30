import 'package:flutter/material.dart';

/// CHIP'D Typography System
/// Based on the CHIP'D Style Guidelines
///
/// Font Family: Inter
/// Weights: 400 (Regular), 600 (Semibold), 700 (Bold), 800 (Extrabold), 900 (Black)
///
/// Font Scale:
/// - Display (Hero Headlines): 72-144px, 900 weight, 0.9 line height, -2% letter spacing
/// - H1 (Section Headers): 48-64px, 800 weight, 1.1 line height, -1% letter spacing
/// - H2 (Subsections): 32-40px, 800 weight, 1.2 line height
/// - H3 (Card Titles): 20-24px, 700 weight, 1.3 line height
/// - Body Text: 16-18px, 400 weight, 1.6 line height
/// - Labels/UI Text: 12-14px, 600 or 800 weight, 5-10% letter spacing, UPPERCASE
/// - Micro-copy: 10-11px, 400 weight, 20-40% letter spacing, UPPERCASE
class ChipdTypography {
  ChipdTypography._();

  static const String fontFamily = 'Inter';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Letter Spacing
  static const double letterSpacingTight = -0.02; // -2%
  static const double letterSpacingNormal = -0.01; // -1%
  static const double letterSpacingLabel = 0.1; // 10%
  static const double letterSpacingMicro = 0.2; // 20%
}

class ApparenceKitTextTheme extends ThemeExtension<ApparenceKitTextTheme> {
  final TextStyle primary;
  final TextStyle display;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle body;
  final TextStyle label;
  final TextStyle micro;

  const ApparenceKitTextTheme({
    required this.primary,
    required this.display,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.body,
    required this.label,
    required this.micro,
  });

  factory ApparenceKitTextTheme.build() => const ApparenceKitTextTheme(
        primary: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 16,
          fontWeight: ChipdTypography.regular,
          color: Color(0xFFFFFFFF),
        ),
        display: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 72,
          fontWeight: ChipdTypography.black,
          height: 0.9,
          letterSpacing: ChipdTypography.letterSpacingTight,
          color: Color(0xFFFFFFFF),
        ),
        h1: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 48,
          fontWeight: ChipdTypography.extraBold,
          height: 1.1,
          letterSpacing: ChipdTypography.letterSpacingNormal,
          color: Color(0xFFFFFFFF),
        ),
        h2: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 32,
          fontWeight: ChipdTypography.extraBold,
          height: 1.2,
          color: Color(0xFFFFFFFF),
        ),
        h3: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 20,
          fontWeight: ChipdTypography.bold,
          height: 1.3,
          color: Color(0xFFFFFFFF),
        ),
        body: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 16,
          fontWeight: ChipdTypography.regular,
          height: 1.6,
          color: Color(0xFFA0A0A0), // textGray
        ),
        label: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 12,
          fontWeight: ChipdTypography.semiBold,
          letterSpacing: ChipdTypography.letterSpacingLabel,
          color: Color(0xFFFFFFFF),
        ),
        micro: TextStyle(
          fontFamily: ChipdTypography.fontFamily,
          fontSize: 10,
          fontWeight: ChipdTypography.regular,
          letterSpacing: ChipdTypography.letterSpacingMicro,
          color: Color(0xFF666666),
        ),
      );

  @override
  ThemeExtension<ApparenceKitTextTheme> copyWith({
    TextStyle? primary,
    TextStyle? display,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? body,
    TextStyle? label,
    TextStyle? micro,
  }) {
    return ApparenceKitTextTheme(
      primary: primary ?? this.primary,
      display: display ?? this.display,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      body: body ?? this.body,
      label: label ?? this.label,
      micro: micro ?? this.micro,
    );
  }

  @override
  ThemeExtension<ApparenceKitTextTheme> lerp(
    covariant ThemeExtension<ApparenceKitTextTheme>? other,
    double t,
  ) {
    if (other is! ApparenceKitTextTheme) {
      return this;
    }
    return ApparenceKitTextTheme(
      primary: TextStyle.lerp(primary, other.primary, t)!,
      display: TextStyle.lerp(display, other.display, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      micro: TextStyle.lerp(micro, other.micro, t)!,
    );
  }
}
