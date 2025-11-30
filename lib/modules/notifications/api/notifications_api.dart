import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/notifications/api/entities/notifications_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final notificationsApiProvider = Provider<NotificationsApi>(
  (ref) => LocalNotificationsApi(
    logger: Logger(),
    client: Supabase.instance.client,
  ),
);

/// NotificationsApi - Stub implementation for MVP
/// Firebase Messaging was removed to simplify development.
/// This implementation only supports local notifications and Supabase-stored notifications.
///
/// To add Firebase push notifications later:
/// 1. Add firebase_core and firebase_messaging to pubspec.yaml
/// 2. Run flutterfire configure
/// 3. Replace LocalNotificationsApi with FirebaseNotificationsApi
abstract class NotificationsApi {
  /// Request permission to receive notifications
  Future<void> requestPermission();

  // Used to get the past notifications from the server
  Future<List<NotificationEntity>> get(
    String userId, {
    DateTime? startDate,
    required int limit,
    int page = 0,
  });

  // Used to mark a notification as read
  Future<void> read(String userId, String notificationId);

  // Used to get the unread notifications count
  Stream<int> unreadNotifications(String userId);

  // Used to get the permission status
  Future<PermissionStatus> getPermissionStatus();
}

/// Local-only notifications API (no Firebase push)
/// Uses Supabase for notification storage and local notifications for display
class LocalNotificationsApi implements NotificationsApi {
  final SupabaseClient _client;
  final Logger _logger;

  LocalNotificationsApi({
    required SupabaseClient client,
    required Logger logger,
  })  : _client = client,
        _logger = logger;

  @override
  Future<void> requestPermission() async {
    await Permission.notification.request();
  }

  @override
  Future<List<NotificationEntity>> get(
    String userId, {
    DateTime? startDate,
    required int limit,
    int page = 0,
  }) async {
    try {
      final response = await _client
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .order('creation_date', ascending: false)
          .range(page * limit, (page + 1) * limit - 1);
      if (response.isEmpty) {
        return [];
      }
      return response
          .map((e) => NotificationEntity.fromJson(e))
          .toList();
    } catch (e, stacktrace) {
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }

  @override
  Future<void> read(String userId, String notificationId) async {
    try {
      await _client
          .from('notifications')
          .update({'read_date': DateTime.now().toString()})
          .eq('user_id', userId)
          .eq('id', notificationId);
    } catch (e, stacktrace) {
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }

  @override
  Stream<int> unreadNotifications(String userId) {
    try {
      return _client
          .from('notifications')
          .stream(primaryKey: ['id'])
          .eq('user_id', userId)
          .limit(10)
          .map((event) => event.length);
    } catch (e, stacktrace) {
      debugPrint('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }

  @override
  Future<PermissionStatus> getPermissionStatus() {
    return Permission.notification.status;
  }
}
