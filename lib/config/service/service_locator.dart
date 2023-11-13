import 'package:get_it/get_it.dart';
import 'package:medicine_reminder_app/features/data/data_source/data_source.dart';
import 'package:medicine_reminder_app/features/data/data_source/local_reminder_datasource.dart';
import 'package:medicine_reminder_app/features/data/repository_impl/notification_repo_impl.dart';
import 'package:medicine_reminder_app/features/domain/repository/notification_repository.dart';
import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_all_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/init_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/show_notifications.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/add_reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/get_reminders.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/remove_reminder.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/notification/notification_cubit.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';

import '../../features/data/data_source/local_notification_datasource.dart';
import '../../features/data/repository_impl/reminder_repo_impl.dart';
import '../../features/presentation/cubit/reminder/reminder_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // cubit
  sl.registerFactory<ReminderCubit>(() => ReminderCubit());
  sl.registerFactory<StorageCubit>(() => StorageCubit(
      getRemindersUseCase: sl(),
      addReminderUseCase: sl(),
      reminderUseCase: sl()));
  sl.registerFactory<NotificationCubit>(() => NotificationCubit(
      initNotificationUseCase: sl(),
      showScheduleNotificationUseCase: sl(),
      cancelNotificationUseCase: sl(),
      cancelAllNotificationUseCase: sl()));

  // use cases
  sl.registerLazySingleton<GetRemindersUseCase>(
      () => GetRemindersUseCase(reminderRepository: sl()));
  sl.registerLazySingleton<AddReminderUseCase>(
      () => AddReminderUseCase(reminderRepository: sl()));
  sl.registerLazySingleton<RemoveReminderUseCase>(
      () => RemoveReminderUseCase(reminderRepository: sl()));

  sl.registerLazySingleton<InitNotificationUseCase>(
      () => InitNotificationUseCase(notificationRepository: sl()));
  sl.registerLazySingleton<ShowScheduleNotificationUseCase>(
      () => ShowScheduleNotificationUseCase(notificationRepository: sl()));
  sl.registerLazySingleton<CancelNotificationUseCase>(
      () => CancelNotificationUseCase(notificationRepository: sl()));
  sl.registerLazySingleton<CancelAllNotificationUseCase>(
      () => CancelAllNotificationUseCase(notificationRepository: sl()));

  // repository
  sl.registerLazySingleton<ReminderRepository>(
      () => ReminderRepositoryImpl(reminderDataSource: sl()));
  sl.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(localNotificationDataSource: sl()));

  // data source
  sl.registerLazySingleton<LocalReminderDataSource>(
      () => LocalReminderDataSourceImpl());
  sl.registerLazySingleton<LocalNotificationDataSource>(
      () => LocalNotificationDataSourceImpl());
}
