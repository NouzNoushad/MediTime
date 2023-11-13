import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class MedicineTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const MedicineTextField(
      {super.key,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: kOutlineInputBorder,
          focusedBorder: kOutlineInputBorder),
    );
  }
}
