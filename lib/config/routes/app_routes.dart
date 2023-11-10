import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/presentation/add_medicine/add_medicine_screen.dart';
import 'package:medicine_reminder_app/presentation/reminder_home/reminder_home.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.home),
            builder: (context) => const MedicineReminderHome());
      case RouteConstants.add:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.add),
            builder: (context) => const AddMedicineScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
