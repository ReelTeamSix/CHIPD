import 'package:apparence_kit/core/theme/colors.dart';
import 'package:apparence_kit/core/theme/providers/theme_provider.dart';
import 'package:apparence_kit/core/theme/texts.dart';
import 'package:apparence_kit/core/theme/theme_data/theme_data.dart';
import 'package:flutter/material.dart';

/// CHIP'D Theme Extensions
/// Convenience extension to access theme properties from BuildContext.
/// Usage: context.colors, context.textTheme, context.chipdText, etc.
extension ApparenceKitThemeExt on BuildContext {
  /// Access CHIP'D color palette
  ApparenceKitColors get colors =>
      Theme.of(this).extension<ApparenceKitColors>()!;

  /// Access Material text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Access CHIP'D custom text styles (display, h1, h2, h3, body, label, micro)
  ApparenceKitTextTheme get chipdText =>
      Theme.of(this).extension<ApparenceKitTextTheme>() ??
      ApparenceKitTextTheme.build();

  /// Access full Material theme data
  ThemeData get theme => Theme.of(this);

  /// Get current brightness (light/dark)
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if currently in dark mode (the primary CHIP'D experience)
  bool get isDarkMode => brightness == Brightness.dark;

  /// Access the full CHIP'D theme data
  ApparenceKitThemeData get kitTheme => ThemeProvider.of(this).current.data;
}

/// CHIP'D Color Convenience Extensions
/// Quick access to commonly used colors and color modifications
extension ChipdColorExt on ApparenceKitColors {
  /// Get the green gradient colors for primary CTA buttons
  List<Color> get primaryGradient => [primary, primaryDark];

  /// Get the gold gradient colors for The 900 tier
  List<Color> get goldGradient => [gold, goldDark];

  /// Card background with glass-morphism effect
  Color get cardBackground => ChipdColors.surfaceOverlay;

  /// Card border color
  Color get cardBorder => ChipdColors.borderLight;

  /// Card border color on hover/focus
  Color get cardBorderHover => ChipdColors.borderGreenHover;
}
