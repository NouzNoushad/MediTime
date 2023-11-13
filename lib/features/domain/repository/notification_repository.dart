abstract class NotificationRepository {
  initNotification();
  showScheduleNotification(
    String title,
    String body,
    String payload,
    String date,
    String hours,
  );
  cancelNotification(int id);
  cancelAllNotifications();
}