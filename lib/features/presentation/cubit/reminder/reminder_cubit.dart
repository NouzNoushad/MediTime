import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entity/reminder.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit()
      : super(ReminderState(
            selectedType: 0,
            dropdownValue: 3,
            selectedDate: DateTime.now().dateTimeToString));

  int selectedType = 0;
  int dropdownValue = 0;
  String initDate = '';

  onTapCalendar(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    initDate = (selectedDate ?? DateTime.now()).dateTimeToString;
    emit(state.copyWith(selectedDate: initDate));
  }

  onChangeDropdownValue(int? value) {
    dropdownValue = value ?? 3;
    emit(state.copyWith(dropdownValue: dropdownValue));
  }

  onTapSelectedType(int index) {
    selectedType = index;
    emit(state.copyWith(selectedType: selectedType));
  }

  convertMedicineType(int index) {
    switch (index) {
      case 0:
        return 'Bottle';
      case 1:
        return 'Table';
      case 2:
        return 'Pill';
      case 3:
        return 'Syringe';
    }
  }

  convertMedicineTypeImage(int index) {
    switch (index) {
      case 0:
        return 'bottle.png';
      case 1:
        return 'medicine.png';
      case 2:
        return 'pill.png';
      case 3:
        return 'syringe.png';
    }
  }

  Reminder addMedicineReminder(String name, String dosage) {
    Reminder reminder = Reminder(
        name,
        initDate,
        dosage,
        dropdownValue.toString(),
        convertMedicineType(selectedType),
        const Uuid().v4(),
        convertMedicineTypeImage(selectedType));
    return reminder;
  }
}
