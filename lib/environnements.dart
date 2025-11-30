// ignore_for_file: avoid_redundant_argument_values

import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'environnements.freezed.dart';

const _kEnvironmentInput = String.fromEnvironment('ENV', defaultValue: 'dev');

/// Supabase project URL
/// This is public - security is handled by RLS policies
const _kSupabaseUrl = 'https://ifduoodnhdtgyvchqgis.supabase.co';

/// Supabase anon key
/// This is PUBLIC and safe to commit - it only allows what RLS permits
const _kSupabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmZHVvb2RuaGR0Z3l2Y2hxZ2lzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0ODk1NTAsImV4cCI6MjA4MDA2NTU1MH0.tOnI8LVRZrjZdUc9d7pUzUrWd6IZOJLOGt0zOIOuOOk';

final environmentProvider = Provider<Environment>(
  (ref) => Environment.fromEnv(),
);

/// The environment of the app.
/// - dev: Development environment
/// - prod: Production environment
/// Feel free to add more environments with your custom properties if needed.
@freezed
sealed class Environment with _$Environment {
  const factory Environment.dev({
    // Name of the environment (dev, prod, ...) just for debug purpose
    required String name,

    /// Url of your backend API / or Supabase URL / or Firebase Functions region
    required String backendUrl,

    /// RevenueCat API key for Android
    /// (only if you want to use in-app purchases with RevenueCat)
    String? revenueCatAndroidApiKey,

    /// RevenueCat API key for iOS
    /// (only if you want to use in-app purchases with RevenueCat)
    String? revenueCatIOSApiKey,

    /// this is used to open the app store page of your app for reviews
    String? appStoreId,

    /// only if you want to use ads
    String? androidInterstitialAdUnitId,

    /// only if you want to use ads
    String? iOSInterstitialAdUnitID,

    /// Environment variable to handle Mixpanel analytics
    /// You can get it from https://mixpanel.com
    String? mixpanelToken,

    /// The default authentication mode of the app (anonymous or authRequired)
    /// See [AuthenticationMode]
    required AuthenticationMode authenticationMode,
  }) = DevEnvironment;

  const factory Environment.prod({
    required String name,

    /// Url of your backend API / or Supabase URL / or Firebase Functions region
    required String backendUrl,

    /// RevenueCat API key for Android
    /// (only if you want to use in-app purchases with RevenueCat)
    String? revenueCatAndroidApiKey,

    /// RevenueCat API key for iOS
    /// (only if you want to use in-app purchases with RevenueCat)
    String? revenueCatIOSApiKey,

    /// only if you want to use ads
    String? androidInterstitialAdUnitId,

    /// only if you want to use ads
    String? iOSInterstitialAdUnitID,

    /// this is used to open the app store page of your app for reviews
    String? appStoreId,

    /// Sentry is an error reporting tool that will help you to track errors in production
    /// You can get it from https://sentry.io
    /// by default sentry will read the SENTRY_DSN environment variable except for web
    /// you can also setup it directly here. Prefer using environment variables
    String? sentryDsn,

    /// Environment variable to handle Mixpanel analytics
    /// You can get it from https://mixpanel.com
    String? mixpanelToken,

    /// The default authentication mode of the app (anonymous or authRequired)
    /// See [AuthenticationMode]
    required AuthenticationMode authenticationMode,
  }) = ProdEnvironment;

  const Environment._();

  /// Supabase anon key - same for all environments
  /// This is public - security is handled by RLS
  String get supabaseAnonKey => _kSupabaseAnonKey;

  factory Environment.fromEnv() {
    switch (_kEnvironmentInput) {
      case 'dev':
        return const Environment.dev(
          name: 'dev',
          backendUrl: _kSupabaseUrl,
          appStoreId: '',
          revenueCatAndroidApiKey: String.fromEnvironment(
            'RC_ANDROID_API_KEY',
            defaultValue: '',
          ),
          revenueCatIOSApiKey: String.fromEnvironment(
            'RC_IOS_API_KEY',
            defaultValue: '',
          ),
          mixpanelToken: String.fromEnvironment("MIXPANEL_TOKEN"),
          // Auth required - no anonymous sign-ins for CHIP'D
          authenticationMode: AuthenticationMode.authRequired,
        );
      case 'prod':
        return const Environment.prod(
          name: 'production',
          backendUrl: _kSupabaseUrl,
          appStoreId: String.fromEnvironment('APP_STORE_ID'),
          revenueCatAndroidApiKey: String.fromEnvironment(
            'RC_ANDROID_API_KEY',
            defaultValue: '',
          ),
          revenueCatIOSApiKey: String.fromEnvironment(
            'RC_IOS_API_KEY',
            defaultValue: '',
          ),
          sentryDsn: String.fromEnvironment('SENTRY_DSN'),
          mixpanelToken: String.fromEnvironment("MIXPANEL_TOKEN"),
          // Auth required - no anonymous sign-ins for CHIP'D
          authenticationMode: AuthenticationMode.authRequired,
        );
      default:
        throw Exception('Unknown environment $_kEnvironmentInput');
    }
  }
}

/// This callback is called when the app is launched.
typedef OnEnvCallback = Future<void> Function();
