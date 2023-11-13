import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';

import '../../entity/reminder.dart';

class GetRemindersUseCase {
  final ReminderRepository _reminderRepository;
  GetRemindersUseCase({required ReminderRepository reminderRepository})
      : _reminderRepository = reminderRepository;
  Future<List<Reminder>> call() =>
      _reminderRepository.getReminders();
}
