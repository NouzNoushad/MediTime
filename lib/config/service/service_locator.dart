import 'package:get_it/get_it.dart';
import 'package:medicine_reminder_app/features/data/data_source/data_source.dart';
import 'package:medicine_reminder_app/features/data/data_source/local_reminder_datasource.dart';
import 'package:medicine_reminder_app/features/domain/repository/reminder_repository.dart';
import 'package:medicine_reminder_app/features/domain/usecase/add_reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/get_reminders.dart';
import 'package:medicine_reminder_app/features/domain/usecase/remove_reminder.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';

import '../../features/data/repository_impl/reminder_repo_impl.dart';
import '../../features/presentation/cubit/reminder/reminder_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // cubit
  sl.registerFactory<ReminderCubit>(() => ReminderCubit());
  sl.registerFactory<StorageCubit>(() => StorageCubit(
    getRemindersUseCase: sl(),
    addReminderUseCase: sl(),
    reminderUseCase: sl()
  ));

  // use cases
  sl.registerLazySingleton<GetRemindersUseCase>(
      () => GetRemindersUseCase(reminderRepository: sl()));
  sl.registerLazySingleton<AddReminderUseCase>(
      () => AddReminderUseCase(reminderRepository: sl()));
  sl.registerLazySingleton<RemoveReminderUseCase>(
      () => RemoveReminderUseCase(reminderRepository: sl()));

  // repository
  sl.registerLazySingleton<ReminderRepository>(() =>
      ReminderRepositoryImpl(reminderDataSource: sl()));

  // data source
  sl.registerLazySingleton<LocalReminderDataSource>(
      () => LocalReminderDataSourceImpl());
}
