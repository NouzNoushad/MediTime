import '../model/reminder_model.dart';

abstract class LocalReminderDataSource {
  Future<List<ReminderModel>> getReminders();
  Future<bool> addReminder(ReminderModel reminder);
  Future<bool> removeReminder(int reminderId);
}
