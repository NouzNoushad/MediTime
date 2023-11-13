import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_all_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/init_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/show_notifications.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final InitNotificationUseCase _initNotificationUseCase;
  final ShowScheduleNotificationUseCase _showScheduleNotificationUseCase;
  final CancelNotificationUseCase _cancelNotificationUseCase;
  final CancelAllNotificationUseCase _cancelAllNotificationUseCase;
  NotificationCubit({
    required InitNotificationUseCase initNotificationUseCase,
    required ShowScheduleNotificationUseCase showScheduleNotificationUseCase,
    required CancelNotificationUseCase cancelNotificationUseCase,
    required CancelAllNotificationUseCase cancelAllNotificationUseCase,
  })  : _initNotificationUseCase = initNotificationUseCase,
        _showScheduleNotificationUseCase = showScheduleNotificationUseCase,
        _cancelAllNotificationUseCase = cancelAllNotificationUseCase,
        _cancelNotificationUseCase = cancelNotificationUseCase,
        super(NotificationInitial());

  initNotification() => _initNotificationUseCase.call();
  showScheduleNotification(String title, String body, String payload,
          String date, String hours) =>
      _showScheduleNotificationUseCase.call(title, body, payload, date, hours);
  cancelNotification(int id) => _cancelNotificationUseCase.call(id);
  cancelAllNotification() => _cancelAllNotificationUseCase.call();
}
