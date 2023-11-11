import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicine_reminder_app/app.dart';
import 'package:medicine_reminder_app/config/service/service_locator.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';

import 'core/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  await Hive.openBox<Reminder>(AppStrings.databaseName);
  initServiceLocator();
  runApp(const MyApp());
}
