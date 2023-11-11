import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';

class RemoveReminderUseCase {
  final ReminderRepository _reminderRepository;
  RemoveReminderUseCase({required ReminderRepository reminderRepository})
      : _reminderRepository = reminderRepository;
  Future<bool> call(int reminderId) =>
      _reminderRepository.removeReminder(reminderId);
}
