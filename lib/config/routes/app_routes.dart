import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/presentation/reminder_home.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.home),
            builder: (context) => const MedicineReminderHome());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
