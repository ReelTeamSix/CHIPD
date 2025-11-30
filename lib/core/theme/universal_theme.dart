import 'package:apparence_kit/core/theme/colors.dart';
import 'package:apparence_kit/core/theme/texts.dart';
import 'package:apparence_kit/core/theme/theme_data/theme_data.dart';
import 'package:apparence_kit/core/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';

/// CHIP'D Universal Theme Factory
/// Implements the CHIP'D Style Guidelines for a consistent design system.
///
/// Key Design Principles:
/// - Dark-first aesthetic with Cyber Green (#00FF94) accents
/// - Inter font family throughout
/// - Glass-morphism card effects
/// - Gradient buttons for primary CTAs
/// - 8px spacing system
class UniversalThemeFactory extends ApparenceKitThemeDataFactory {
  const UniversalThemeFactory();

  // Border Radius Scale (per Style Guidelines)
  static const double radiusSmall = 8.0; // buttons, badges
  static const double radiusMedium = 16.0; // cards
  static const double radiusLarge = 24.0; // modals
  static const double radiusFull = 9999.0; // pills, dots

  // Spacing System (8px base unit)
  static const double spacing0 = 4.0;
  static const double spacing1 = 8.0;
  static const double spacing2 = 16.0;
  static const double spacing3 = 24.0;
  static const double spacing4 = 32.0;
  static const double spacing6 = 48.0;
  static const double spacing8 = 64.0;

  @override
  ApparenceKitThemeData build({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme defaultTextStyle,
  }) {
    return ApparenceKitThemeData(
      colors: colors,
      defaultTextTheme: defaultTextStyle,
      materialTheme: ThemeData(
        useMaterial3: true,
        fontFamily: ChipdTypography.fontFamily,
        brightness: colors.background == ChipdColors.brandDark
            ? Brightness.dark
            : Brightness.light,
        scaffoldBackgroundColor: colors.background,
        colorScheme: ColorScheme(
          brightness: colors.background == ChipdColors.brandDark
              ? Brightness.dark
              : Brightness.light,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.primary,
          onSecondary: colors.onPrimary,
          error: colors.error,
          onError: ChipdColors.pureWhite,
          surface: colors.surface,
          onSurface: colors.onSurface,
        ),
        elevatedButtonTheme: _buildElevatedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        outlinedButtonTheme: _buildOutlinedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textButtonTheme: _buildTextButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        inputDecorationTheme: _buildInputDecorationTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textTheme: _buildTextTheme(
          colors: colors,
          defaultTextStyle: defaultTextStyle,
        ),
        navigationRailTheme: _buildNavigationRailThemeData(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.background,
          foregroundColor: colors.onBackground,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: defaultTextStyle.h3.copyWith(
            color: colors.onBackground,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colors.surface,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.grey2,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: ChipdColors.surfaceOverlay,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
            side: const BorderSide(
              color: ChipdColors.borderLight,
              width: 1,
            ),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLarge),
          ),
          titleTextStyle: defaultTextStyle.h3.copyWith(
            color: colors.onSurface,
          ),
          contentTextStyle: defaultTextStyle.body.copyWith(
            color: colors.grey2,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: colors.surface,
          contentTextStyle: defaultTextStyle.body.copyWith(
            color: colors.onSurface,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
          behavior: SnackBarBehavior.floating,
        ),
        dividerTheme: const DividerThemeData(
          color: ChipdColors.borderLight,
          thickness: 1,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.primary,
          linearTrackColor: colors.grey1,
          circularTrackColor: colors.grey1,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primary;
            }
            return colors.grey2;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primary.withValues(alpha: 0.3);
            }
            return colors.grey1;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primary;
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(colors.onPrimary),
          side: BorderSide(color: colors.grey2, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primary;
            }
            return colors.grey2;
          }),
        ),
        pageTransitionsTheme: _pageTransitionsTheme,
      ),
    );
  }

  NavigationRailThemeData _buildNavigationRailThemeData({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      NavigationRailThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: colors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: colors.grey2,
        ),
        selectedLabelTextStyle: textTheme.primary.copyWith(
          color: colors.primary,
          fontSize: 14,
          fontWeight: ChipdTypography.bold,
        ),
        unselectedLabelTextStyle: textTheme.primary.copyWith(
          color: colors.onSurface,
          fontSize: 14,
          fontWeight: ChipdTypography.semiBold,
        ),
      );

  /// Primary CTA Button - Green gradient, dark text
  /// Per Style Guidelines: uppercase, 800 weight, letter-spacing 0.2em
  ElevatedButtonThemeData _buildElevatedButtonTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.onPrimary,
          backgroundColor: colors.primary,
          disabledBackgroundColor: colors.grey1,
          disabledForegroundColor: colors.grey2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
          textStyle: textTheme.label.copyWith(
            fontSize: 14,
            fontWeight: ChipdTypography.extraBold,
            letterSpacing: 3.2, // 0.2em equivalent at 16px base
            color: colors.onPrimary,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: spacing4,
            vertical: spacing2,
          ),
          elevation: 0,
        ),
      );

  /// Secondary Button - Outline style, transparent background
  /// Per Style Guidelines: 1px border, white text, 600 weight
  OutlinedButtonThemeData _buildOutlinedButtonTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.onBackground,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: colors.grey2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
          side: const BorderSide(
            color: ChipdColors.borderMedium,
            width: 1,
          ),
          textStyle: textTheme.label.copyWith(
            fontSize: 14,
            fontWeight: ChipdTypography.semiBold,
            color: colors.onBackground,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: spacing3,
            vertical: spacing2 - 2,
          ),
          elevation: 0,
        ),
      );

  TextButtonThemeData _buildTextButtonTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: textTheme.label.copyWith(
            fontWeight: ChipdTypography.semiBold,
            color: colors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
        ),
      );

  /// Input Fields - Glass-morphism style
  /// Per Style Guidelines: rgba(255,255,255,0.05) background, subtle borders
  InputDecorationTheme _buildInputDecorationTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      InputDecorationTheme(
        fillColor: ChipdColors.surfaceOverlay,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacing2,
          vertical: spacing2 - 4,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium - 4), // 12px
          borderSide: const BorderSide(
            color: ChipdColors.borderLight,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium - 4),
          borderSide: BorderSide(
            color: colors.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium - 4),
          borderSide: BorderSide(
            color: colors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium - 4),
          borderSide: BorderSide(
            color: colors.error,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium - 4),
          borderSide: BorderSide(
            color: colors.grey1.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        hintStyle: textTheme.body.copyWith(
          color: colors.grey2.withValues(alpha: 0.6),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: textTheme.body.copyWith(
          color: colors.grey2,
        ),
        errorStyle: textTheme.micro.copyWith(
          color: colors.error,
          letterSpacing: 0,
        ),
        prefixIconColor: colors.grey2,
        suffixIconColor: colors.grey2,
      );

  PageTransitionsTheme get _pageTransitionsTheme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  /// Text Theme - Inter font with CHIP'D scale
  TextTheme _buildTextTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme defaultTextStyle,
  }) =>
      TextTheme(
        // Display styles
        displayLarge: defaultTextStyle.display.copyWith(
          color: colors.onBackground,
        ),
        displayMedium: defaultTextStyle.display.copyWith(
          fontSize: 56,
          color: colors.onBackground,
        ),
        displaySmall: defaultTextStyle.display.copyWith(
          fontSize: 44,
          color: colors.onBackground,
        ),
        // Headline styles (H1-H3)
        headlineLarge: defaultTextStyle.h1.copyWith(
          color: colors.onBackground,
        ),
        headlineMedium: defaultTextStyle.h2.copyWith(
          color: colors.onBackground,
        ),
        headlineSmall: defaultTextStyle.h3.copyWith(
          color: colors.onBackground,
        ),
        // Title styles
        titleLarge: defaultTextStyle.h3.copyWith(
          fontSize: 22,
          color: colors.onBackground,
        ),
        titleMedium: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          fontWeight: ChipdTypography.semiBold,
          color: colors.onBackground,
        ),
        titleSmall: defaultTextStyle.primary.copyWith(
          fontSize: 14,
          fontWeight: ChipdTypography.semiBold,
          color: colors.onBackground,
        ),
        // Body styles
        bodyLarge: defaultTextStyle.body.copyWith(
          fontSize: 18,
          color: colors.grey2,
        ),
        bodyMedium: defaultTextStyle.body.copyWith(
          color: colors.grey2,
        ),
        bodySmall: defaultTextStyle.body.copyWith(
          fontSize: 14,
          color: colors.grey2,
        ),
        // Label styles
        labelLarge: defaultTextStyle.label.copyWith(
          fontSize: 14,
          fontWeight: ChipdTypography.extraBold,
          color: colors.onBackground,
        ),
        labelMedium: defaultTextStyle.label.copyWith(
          color: colors.onBackground,
        ),
        labelSmall: defaultTextStyle.micro.copyWith(
          color: colors.grey2,
        ),
      );
}
