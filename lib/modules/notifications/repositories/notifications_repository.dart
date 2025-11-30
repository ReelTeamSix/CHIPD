import 'package:apparence_kit/core/initializer/onstart_service.dart';
import 'package:apparence_kit/modules/notifications/api/local_notifier.dart';
import 'package:apparence_kit/modules/notifications/api/notifications_api.dart';
import 'package:apparence_kit/modules/notifications/providers/models/notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class NotificationsRepository implements OnStartService {
  // this method is used to get the notifications from the server
  Future<List<Notification>> get(
    String userId, {
    int pageSize = 20,
    DateTime? startDate,
  });

  // mark a notification as read
  Future<Notification> read(String userId, Notification notification);

  // listen to the unread notifications count
  Stream<int> listenToUnreadNotificationsCount(String userId);

  // return the permission status
  Future<NotificationPermission> getPermissionStatus();
}

final notificationRepositoryProvider = Provider<NotificationsRepository>(
  (ref) => AppNotificationsRepository(
    notificationsApi: ref.watch(notificationsApiProvider),
    localNotifier: ref.watch(localNotifierProvider),
    notificationSettings: ref.watch(notificationsSettingsProvider),
  ),
);

/// MVP Implementation - Local notifications only (no Firebase push)
/// Firebase push notifications were removed to simplify development.
///
/// To add Firebase push notifications later:
/// 1. Add firebase_messaging to pubspec.yaml
/// 2. Restore the _onMessage and _onOpenMessage handlers
/// 3. Add topic subscriptions in init()
class AppNotificationsRepository implements NotificationsRepository {
  final NotificationsApi _notificationsApi;
  final LocalNotifier _localNotifier;
  final NotificationSettings _notificationSettings;

  AppNotificationsRepository({
    required NotificationsApi notificationsApi,
    required LocalNotifier localNotifier,
    required NotificationSettings notificationSettings,
  })  : _notificationsApi = notificationsApi,
        _localNotifier = localNotifier,
        _notificationSettings = notificationSettings;

  @override
  Future<void> init() async {
    final permission = await getPermissionStatus();
    if (permission is NotificationPermissionGranted) {
      _notificationSettings.init();
      // Note: Firebase push notification handlers removed for MVP
      // Local notifications still work via LocalNotifier
    }
  }

  @override
  Future<NotificationPermission> getPermissionStatus() async {
    final systemStatus = await _notificationsApi.getPermissionStatus();
    switch (systemStatus) {
      case PermissionStatus.granted:
        return NotificationPermissionGranted();
      case PermissionStatus.denied:
        return NotificationPermissionDenied(
          notificationSettings: _notificationSettings,
          repository: this,
        );
      case PermissionStatus.permanentlyDenied:
        return NotificationPermissionDenied(
          notificationSettings: _notificationSettings,
          repository: this,
        );
      default:
        return NotificationPermissionWaiting();
    }
  }

  @override
  Future<List<Notification>> get(
    String userId, {
    int pageSize = 20,
    DateTime? startDate,
  }) async {
    final notificationEntities = await _notificationsApi.get(
      userId,
      limit: pageSize,
      startDate: startDate,
    );
    final notifications = notificationEntities
        .map(
          (e) => Notification.withData(
            id: e.id,
            title: e.title,
            body: e.body,
            createdAt: e.creationDate,
            readAt: e.readDate,
            type: e.type,
            data: e.data,
            notifier: _localNotifier,
            notifierSettings: _notificationSettings,
          ),
        )
        .toList();
    return notifications;
  }

  @override
  Future<Notification> read(String userId, Notification notification) async {
    if (notification.id == null) {
      throw Exception('A notification without id cannot be read');
    }
    await _notificationsApi.read(userId, notification.id!);
    return notification.copyWith(readAt: DateTime.now());
  }

  @override
  Stream<int> listenToUnreadNotificationsCount(String userId) {
    return _notificationsApi.unreadNotifications(userId);
  }
}
