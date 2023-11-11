import 'package:flutter/material.dart';

AppBar appBar({
  required String title,
  List<Widget>? actions,
  bool leading = false,
}) => AppBar(
        automaticallyImplyLeading: leading,
        title: Text(title),
        actions: actions,
      );