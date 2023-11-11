import 'package:hive/hive.dart';
import 'package:medicine_reminder_app/core/mapper/reminder_mapper.dart';
import 'package:medicine_reminder_app/features/data/data_source/data_source.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';
import 'package:medicine_reminder_app/core/utils/strings.dart';

import '../model/reminder_model.dart';

class LocalReminderDataSourceImpl extends LocalReminderDataSource {
  final Box<Reminder> openBox = Hive.box(AppStrings.databaseName);
  @override
  Future<bool> addReminder(ReminderModel reminder) async {
    openBox.put(reminder.id, reminder);
    return true;
  }

  @override
  Future<List<ReminderModel>> getReminders() async {
    List<ReminderModel> reminders =
        openBox.values.map((e) => ReminderMapper().fromEntity(e)).toList();
    return reminders;
  }

  @override
  Future<bool> removeReminder(int reminderId) async {
    openBox.delete(reminderId);
    return true;
  }
}
