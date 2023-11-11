import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';
import 'package:medicine_reminder_app/features/presentation/screens/add_medicine/components/date_time.dart';
import 'package:medicine_reminder_app/features/presentation/screens/add_medicine/components/medicine_type.dart';
import 'package:medicine_reminder_app/features/presentation/widgets/app_bar.dart';
import 'package:medicine_reminder_app/features/presentation/widgets/text_form_field.dart';
import 'package:medicine_reminder_app/core/utils/colors.dart';
import 'package:medicine_reminder_app/core/utils/constants.dart';
import 'package:medicine_reminder_app/core/utils/strings.dart';

import '../../cubit/reminder/reminder_cubit.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorPicker.primaryColor,
        label: const Text('Confirm'),
        onPressed: () {
          Reminder reminder = context
              .read<ReminderCubit>()
              .addMedicineReminder(nameController.text, dosageController.text);
          context.read<StorageCubit>().addToStorageEvent(reminder);
        },
        icon: const Icon(Icons.check),
      ),
      appBar: appBar(title: AppStrings.addTitle, leading: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          MedicineTextField(
              hintText: 'Medicine Name', controller: nameController),
          h(10),
          MedicineTextField(
            hintText: 'Dosage in mg',
            controller: dosageController,
            keyboardType: TextInputType.number,
          ),
          h(10),
          const ReminderDateAndTime(),
          h(15),
          BlocBuilder<ReminderCubit, ReminderState>(
            builder: (context, state) {
              return MedicineTypes(state: state);
            },
          )
        ]),
      ),
    );
  }
}
