import 'dart:async';

import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/notifications/api/entities/device_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_io/io.dart';

abstract class DeviceApi {
  /// We use a unique id for the device / installation
  /// This allows to send notifications to a specific device
  Future<DeviceEntity> get();

  /// Register the device in the backend
  /// throws an [ApiError] if something goes wrong
  Future<DeviceEntity> register(String userId, DeviceEntity device);

  /// Update the device in the backend
  /// throws an [ApiError] if something goes wrong
  Future<DeviceEntity> update(DeviceEntity device);

  /// Unregister the device in the backend
  Future<void> unregister(String userId, String deviceId);

  /// Listen to token refresh
  void onTokenRefresh(OnTokenRefresh onTokenRefresh);

  /// Remove the token refresh listener
  void removeOnTokenRefreshListener();
}

typedef OnTokenRefresh = void Function(String token);

final deviceApiProvider = Provider<DeviceApi>(
  (ref) => StubDeviceApi(
    client: Supabase.instance.client,
  ),
);

/// Stub DeviceApi implementation for MVP (no Firebase)
/// Firebase was removed to simplify development.
/// Device registration/token management requires Firebase Messaging.
///
/// To add Firebase device management later:
/// 1. Add firebase_app_installations and firebase_messaging to pubspec.yaml
/// 2. Replace StubDeviceApi with FirebaseDeviceApi
class StubDeviceApi implements DeviceApi {
  final SupabaseClient _client;

  StubDeviceApi({
    required SupabaseClient client,
  }) : _client = client;

  @override
  Future<DeviceEntity> get() async {
    // Generate a simple device ID without Firebase
    // In production, you might use device_info_plus or a UUID
    final os = Platform.isAndroid
        ? OperatingSystem.android
        : OperatingSystem.ios;
    return DeviceEntity(
      installationId: 'stub-device-id',
      token: 'stub-token',
      operatingSystem: os,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    );
  }

  @override
  Future<DeviceEntity> register(String userId, DeviceEntity device) async {
    // Stub: No-op for MVP without Firebase push
    return device.copyWith(userId: userId);
  }

  @override
  Future<DeviceEntity> update(DeviceEntity device) async {
    // Stub: No-op for MVP without Firebase push
    return device;
  }

  @override
  Future<void> unregister(String userId, String installationId) async {
    // Stub: No-op for MVP without Firebase push
  }

  @override
  void onTokenRefresh(OnTokenRefresh onTokenRefresh) {
    // Stub: No-op - no Firebase token refresh without Firebase
  }

  @override
  void removeOnTokenRefreshListener() {
    // Stub: No-op
  }
}
