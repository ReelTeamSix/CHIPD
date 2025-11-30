import 'package:another_flushbar/flushbar.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

final toastProvider = Provider<ToastBuilder>((ref) => ToastBuilder());

class ToastBuilder {
  void success({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
  }) {
    showSuccessToast(
      context: navigatorKey.currentContext!,
      title: title,
      text: text,
      duration: duration,
    );
  }

  void error({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
    String? reason,
  }) {
    showErrorToast(
      context: navigatorKey.currentContext!,
      title: title,
      text: text,
      duration: duration,
      reason: reason,
    );
  }

  void alert({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    if (navigatorKey.currentContext == null ||
        !navigatorKey.currentContext!.mounted) {
      return;
    }
    final context = navigatorKey.currentContext!;
    final colors = context.colors;
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: title,
      message: text,
      titleSize: 21,
      messageSize: 16,
      duration: duration,
      leftBarIndicatorColor: colors.primary,
      backgroundColor: colors.surface,
      titleColor: colors.onSurface,
      messageColor: colors.onSurface,
    ).show(context);
  }
}

void showSuccessToast({
  required BuildContext context,
  required String title,
  required String text,
  Duration duration = const Duration(seconds: 3),
}) {
  // This is a hack to prevent the toast from showing during tests
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    return;
  }
  if (!context.mounted) {
    return;
  }
    final colors = context.colors;
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: title,
      message: text,
      titleSize: 24,
      messageSize: 14,
      duration: duration,
      barBlur: 8,
      backgroundColor: colors.background.withValues(alpha: 0.9),
      titleColor: colors.onBackground,
      messageColor: colors.onBackground,
      leftBarIndicatorColor: colors.primary,
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      icon: Icon(
        Icons.check,
        color: colors.primary,
        size: 32,
      ),
      shouldIconPulse: false,
    ).show(context);
}

void showErrorToast({
  required BuildContext context,
  required String title,
  required String text,
  Duration duration = const Duration(seconds: 3),
  String? reason,
}) {
  // This is a hack to prevent the toast from showing during tests
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    return;
  }
  if (!context.mounted) {
    return;
  }
  final colors = context.colors;
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: text,
    titleSize: 21,
    messageSize: 16,
    duration: duration,
    backgroundColor: colors.error,
    icon: Icon(
      Icons.error,
      color: colors.onPrimary,
    ),
    titleColor: colors.onPrimary,
    messageColor: colors.onPrimary,
  ).show(context);
}
