part of 'reminder_cubit.dart';

class ReminderState extends Equatable {
  final int? selectedType;
  final int? dropdownValue;
  final String? selectedDate;

  const ReminderState(
      {this.selectedType, this.dropdownValue, this.selectedDate});

  ReminderState copyWith(
      {int? selectedType, int? dropdownValue, String? selectedDate}) {
    return ReminderState(
        selectedType: selectedType ?? this.selectedType,
        dropdownValue: dropdownValue ?? this.dropdownValue,
        selectedDate: selectedDate ?? this.selectedDate);
  }

  @override
  List<Object> get props => [selectedType!, dropdownValue!, selectedDate!];
}
