import 'package:apparence_kit/modules/notifications/repositories/notifications_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data/local_notifier_fake.dart';
import '../data/notifications_api_fake.dart';
import '../data/notifications_settings_fake.dart';

void main() {
  final fakeNotificationsApi = FakeNotificationsApi();
  final fakeLocalNotificationsApi = FakeLocalNotifier();
  final fakeNotificationsSettings = NotificationsSettingsFake();

  final repository = AppNotificationsRepository(
    notificationsApi: fakeNotificationsApi,
    localNotifier: fakeLocalNotificationsApi,
    notificationSettings: fakeNotificationsSettings,
  );

  test('fetch notifications, should return 20 notifications', () async {
    final notifications = await repository.get('userId');
    expect(notifications.length, 20);
    final firstNotif = notifications.first;
    expect(firstNotif.id, isNotNull);
    expect(firstNotif.title, isNotNull);
    expect(firstNotif.body, isNotNull);
    expect(firstNotif.createdAt, isNotNull);
  });

  test('read notification', () async {
    final notifications = await repository.get('userId');
    final readNotification = await repository.read(
      'userId',
      notifications.first,
    );
    expect(readNotification, isNotNull);
    expect(readNotification.seen, isTrue);
  });

  test('listen to user notifications count', () async {
    final count$ = repository.listenToUnreadNotificationsCount('userId');
    final count = await count$.first;
    expect(count, 1);
  });
}
