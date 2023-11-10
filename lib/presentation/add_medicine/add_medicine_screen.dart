import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/presentation/add_medicine/components/date_time.dart';
import 'package:medicine_reminder_app/presentation/widgets/app_bar.dart';
import 'package:medicine_reminder_app/presentation/widgets/text_form_field.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/constants.dart';
import 'package:medicine_reminder_app/utils/extensions.dart';
import 'package:medicine_reminder_app/utils/strings.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  int selectedType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorPicker.primaryColor,
        label: const Text('Confirm'),
        onPressed: () {},
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...medicineTypes.map((e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = medicineTypes.indexOf(e);
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/${e.image}',
                          height: context.height * 0.1,
                        ),
                        h(10),
                        Container(
                            width: context.width * 0.2,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: selectedType == medicineTypes.indexOf(e)
                                    ? ColorPicker.primaryColor
                                    : ColorPicker.lightColor),
                            child: Text(
                              e.title,
                              style: const TextStyle(
                                  color: ColorPicker.backgroundColor),
                            )),
                      ],
                    ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
