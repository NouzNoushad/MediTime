import 'package:medicine_reminder_app/features/data/data_source/data_source.dart';
import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final LocalNotificationDataSource _localNotificationDataSource;
  NotificationRepositoryImpl({
    required LocalNotificationDataSource localNotificationDataSource,
  }) : _localNotificationDataSource = localNotificationDataSource;

  @override
  cancelAllNotifications() =>
      _localNotificationDataSource.cancelAllNotifications();

  @override
  cancelNotification(int id) =>
      _localNotificationDataSource.cancelNotification(id);

  @override
  initNotification() => _localNotificationDataSource.initNotification();

  @override
  showScheduleNotification(String title, String body, String payload,
          String date, String hours) =>
      _localNotificationDataSource.showScheduleNotification(
          title, body, payload, date, hours);
}
