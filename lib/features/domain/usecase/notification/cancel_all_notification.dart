import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';

class CancelAllNotificationUseCase {
  final NotificationRepository _notificationRepository;
  CancelAllNotificationUseCase(
      {required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;

  call() => _notificationRepository.cancelAllNotifications();
}
