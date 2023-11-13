import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/features/presentation/models/medicine_type.dart';
import 'package:medicine_reminder_app/core/utils/colors.dart';

OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(width: 1.5, color: ColorPicker.primaryColor),
);

SizedBox h(double height) => SizedBox(
      height: height,
    );
SizedBox w(double width) => SizedBox(
      width: width,
    );

List<MedicineType> medicineTypes = [
  MedicineType(image: 'bottle.png', title: 'Bottle'),
  MedicineType(image: 'medicine.png', title: 'Tablet'),
  MedicineType(image: 'pill.png', title: 'Pill'),
  MedicineType(image: 'syringe.png', title: 'Syringe'),
];

List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

void logger({required String msg, required dynamic debug}) =>
    debugPrint('$msg: $debug');

showSnackBar(context, msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: ColorPicker.primaryColor,
        behavior: SnackBarBehavior.floating,
        content: Text(msg)));
