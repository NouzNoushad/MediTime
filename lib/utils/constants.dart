import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/models/medicine_type.dart';
import 'package:medicine_reminder_app/utils/colors.dart';

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
