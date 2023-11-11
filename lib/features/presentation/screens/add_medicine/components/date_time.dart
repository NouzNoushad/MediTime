import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/core/utils/extensions.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../cubit/reminder/reminder_cubit.dart';

class ReminderDateAndTime extends StatefulWidget {
  const ReminderDateAndTime({super.key});

  @override
  State<ReminderDateAndTime> createState() => _ReminderDateAndTimeState();
}

class _ReminderDateAndTimeState extends State<ReminderDateAndTime> {
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
              child: BlocBuilder<ReminderCubit, ReminderState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () =>
                        context.read<ReminderCubit>().onTapCalendar(context),
                    child: Material(
                      color: ColorPicker.transparentColor,
                      child: Row(children: [
                        const Icon(Icons.calendar_month),
                        w(15),
                        Expanded(child: Text(state.selectedDate.toString()))
                      ]),
                    ),
                  );
                },
              ),
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
              child: BlocBuilder<ReminderCubit, ReminderState>(
                builder: (context, state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Repeat hour:'),
                        SizedBox(
                          height: context.height * 0.3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                                isExpanded: false,
                                value: state.dropdownValue,
                                onChanged: context
                                    .read<ReminderCubit>()
                                    .onChangeDropdownValue,
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
                      ]);
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
