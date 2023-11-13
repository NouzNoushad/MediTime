import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';

class ShowScheduleNotificationUseCase {
  final NotificationRepository _notificationRepository;
  ShowScheduleNotificationUseCase(
      {required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;

  call(String title, String body, String payload, String date, String hours) => _notificationRepository.showScheduleNotification(
      title, body, payload, date, hours);
}
