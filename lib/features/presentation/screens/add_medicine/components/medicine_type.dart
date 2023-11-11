import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/core/utils/extensions.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../cubit/reminder/reminder_cubit.dart';


class MedicineTypes extends StatelessWidget {
  final ReminderState state;
  const MedicineTypes({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...medicineTypes.map((e) => GestureDetector(
              onTap: () => context
                  .read<ReminderCubit>()
                  .onTapSelectedType(medicineTypes.indexOf(e)),
              child: Material(
                color: ColorPicker.transparentColor,
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
                            color:
                                state.selectedType == medicineTypes.indexOf(e)
                                    ? ColorPicker.primaryColor
                                    : ColorPicker.lightColor),
                        child: Text(
                          e.title,
                          style: const TextStyle(
                              color: ColorPicker.backgroundColor),
                        )),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
