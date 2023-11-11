import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension DateTimeToStringExt on DateTime {
  String get dateTimeToString =>
      DateFormat('dd/MM/yyyy').format(this);
}
