import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';

import '../entity/reminder.dart';

class AddReminderUseCase {
  final ReminderRepository _reminderRepository;
  AddReminderUseCase({required ReminderRepository reminderRepository})
      : _reminderRepository = reminderRepository;
  Future<bool> call(Reminder reminder) =>
      _reminderRepository.addReminder(reminder);
}
