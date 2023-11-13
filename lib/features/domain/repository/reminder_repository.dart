import '../entity/reminder.dart';

abstract class ReminderRepository {
  Future<List<Reminder>> getReminders();
  Future<bool> addReminder(Reminder reminder);
  Future<bool> removeReminder(String reminderId);
}