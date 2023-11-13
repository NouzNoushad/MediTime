import 'package:medicine_reminder_app/core/mapper/reminder_mapper.dart';
import 'package:medicine_reminder_app/features/data/data_source/data_source.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';
import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';

class ReminderRepositoryImpl extends ReminderRepository {
  final LocalReminderDataSource _reminderDataSource;
  ReminderRepositoryImpl({required LocalReminderDataSource reminderDataSource})
      : _reminderDataSource = reminderDataSource;
  @override
  Future<bool> addReminder(Reminder reminder) =>
      _reminderDataSource.addReminder(ReminderMapper().fromEntity(reminder));

  @override
  Future<List<Reminder>> getReminders() => _reminderDataSource.getReminders();

  @override
  Future<bool> removeReminder(String reminderId) =>
      _reminderDataSource.removeReminder(reminderId);
}
