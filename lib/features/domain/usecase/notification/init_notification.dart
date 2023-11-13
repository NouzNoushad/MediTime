import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';

class InitNotificationUseCase {
  final NotificationRepository _notificationRepository;
  InitNotificationUseCase(
      {required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;

  call() => _notificationRepository.initNotification();
}
