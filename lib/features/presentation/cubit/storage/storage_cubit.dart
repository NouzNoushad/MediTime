import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_reminder_app/core/utils/constants.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/add_reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/get_reminders.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/remove_reminder.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  final GetRemindersUseCase _getRemindersUseCase;
  final AddReminderUseCase _addReminderUseCase;
  final RemoveReminderUseCase _reminderUseCase;
  StorageCubit({
    required GetRemindersUseCase getRemindersUseCase,
    required AddReminderUseCase addReminderUseCase,
    required RemoveReminderUseCase reminderUseCase,
  })  : _getRemindersUseCase = getRemindersUseCase,
        _addReminderUseCase = addReminderUseCase,
        _reminderUseCase = reminderUseCase,
        super(StorageInitial());

  getStorageEvent() async {
    emit(StorageLoading());
    try {
      List<Reminder> reminders = await _getRemindersUseCase.call();
      emit(StorageLoadedState(reminders));
    } catch (error) {
      emit(StorageErrorState(error.toString()));
    }
  }

  addToStorageEvent(Reminder reminder) async {
    bool added = await _addReminderUseCase.call(reminder);
    getStorageEvent();
    logger(msg: 'added', debug: '$added');
    emit(AddToStorageState(added));
  }

  removeFromStorageEvent(String reminderId) async {
    bool removed = await _reminderUseCase.call(reminderId);
    getStorageEvent();
    logger(msg: 'remove', debug: '$removed');
    emit(RemoveFromStorageState(removed));
  }
}
