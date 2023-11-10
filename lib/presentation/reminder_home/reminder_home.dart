import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/presentation/widgets/app_bar.dart';
import 'package:medicine_reminder_app/utils/strings.dart';

class MedicineReminderHome extends StatelessWidget {
  const MedicineReminderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(
          title: AppStrings.appTitle,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteConstants.add);
                },
                icon: const Icon(Icons.timer)),
          ],
        ));
  }
}
