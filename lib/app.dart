import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/config/routes/app_routes.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/config/service/service_locator.dart';
import 'package:medicine_reminder_app/config/theme/app_theme.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_all_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/cancel_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/notification/init_notification.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/add_reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/get_reminders.dart';
import 'package:medicine_reminder_app/features/domain/usecase/storage/remove_reminder.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/notification/notification_cubit.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';
import 'features/domain/usecase/notification/show_notifications.dart';
import 'features/presentation/cubit/reminder/reminder_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReminderCubit(),
        ),
        BlocProvider(
          create: (context) => StorageCubit(
            getRemindersUseCase: sl<GetRemindersUseCase>(),
            addReminderUseCase: sl<AddReminderUseCase>(),
            reminderUseCase: sl<RemoveReminderUseCase>(),
          ),
        ),
        BlocProvider(
            create: (context) => NotificationCubit(
                initNotificationUseCase: sl<InitNotificationUseCase>(),
                showScheduleNotificationUseCase:
                    sl<ShowScheduleNotificationUseCase>(),
                cancelNotificationUseCase: sl<CancelNotificationUseCase>(),
                cancelAllNotificationUseCase:
                    sl<CancelAllNotificationUseCase>()))
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: RouteConstants.home,
      ),
    );
  }
}
