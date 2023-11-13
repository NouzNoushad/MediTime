import '../model/reminder_model.dart';

abstract class LocalReminderDataSource {
  Future<List<ReminderModel>> getReminders();
  Future<bool> addReminder(ReminderModel reminder);
  Future<bool> removeReminder(String reminderId);
}

abstract class LocalNotificationDataSource {
  initNotification();
  showScheduleNotification(String title,
    String body,
    String payload,
    String date,
    String hours,);
  cancelNotification(int id);
  cancelAllNotifications();
}
