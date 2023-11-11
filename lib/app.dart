import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/config/routes/app_routes.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/config/service/service_locator.dart';
import 'package:medicine_reminder_app/config/theme/app_theme.dart';
import 'package:medicine_reminder_app/features/domain/usecase/add_reminder.dart';
import 'package:medicine_reminder_app/features/domain/usecase/get_reminders.dart';
import 'package:medicine_reminder_app/features/domain/usecase/remove_reminder.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';
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
