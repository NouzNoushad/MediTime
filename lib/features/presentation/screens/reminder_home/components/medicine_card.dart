import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/core/utils/extensions.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../domain/entity/reminder.dart';
import '../../../cubit/storage/storage_cubit.dart';

class MedicineReminderCard extends StatelessWidget {
  final Reminder medicine;
  const MedicineReminderCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 1, color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/${medicine.image}',
                  height: context.height * 0.06,
                ),
                const Spacer(),
                Text(
                  medicine.name.toCamelCase(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorPicker.textColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                h(5),
                Text(
                  '${medicine.dosage} mg',
                  maxLines: 1,
                  style: const TextStyle(
                    color: ColorPicker.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                h(10),
                Text(
                  'Repeat every ${medicine.hour} hrs',
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorPicker.textColor,
                  ),
                ),
                h(4),
                Text(
                  'Start: ${medicine.date}',
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorPicker.textColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  context
                      .read<StorageCubit>()
                      .removeFromStorageEvent(medicine.id);
                  showSnackBar(context, 'Reminder removed successfully');
                },
                child: const CircleAvatar(
                    backgroundColor: ColorPicker.primaryColor,
                    radius: 12,
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: ColorPicker.backgroundColor,
                    )),
              )),
        ],
      ),
    );
  }
}
