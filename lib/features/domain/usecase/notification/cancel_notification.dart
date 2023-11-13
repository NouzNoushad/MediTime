import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';

class CancelNotificationUseCase {
  final NotificationRepository _notificationRepository;
  CancelNotificationUseCase(
      {required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;

 call(int id) => _notificationRepository.cancelNotification(id);
}
