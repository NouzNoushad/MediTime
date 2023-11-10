import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/utils/extensions.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class ReminderDateAndTime extends StatefulWidget {
  const ReminderDateAndTime({super.key});

  @override
  State<ReminderDateAndTime> createState() => _ReminderDateAndTimeState();
}

class _ReminderDateAndTimeState extends State<ReminderDateAndTime> {
  List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int dropdownValue = 3;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        height: context.height * 0.08,
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: context.height,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: ColorPicker.primaryColor),
              ),
              child: Row(children: [
                const Icon(Icons.calendar_month),
                w(15),
                const Expanded(child: Text('10/11/2023'))
              ]),
            )),
            w(10),
            Expanded(
                child: Container(
              height: context.height,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: ColorPicker.primaryColor),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Repeat hour:'),
                    SizedBox(
                      height: context.height * 0.3,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                            isExpanded: false,
                            value: dropdownValue,
                            onChanged: (int? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: List.generate(
                                hours.length,
                                (index) => DropdownMenuItem<int>(
                                      value: hours[index],
                                      child: Center(
                                        child: Text(
                                          '${hours[index]}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))),
                      ),
                    )
                  ]),
            )),
          ],
        ),
      ),
    );
  }
}
