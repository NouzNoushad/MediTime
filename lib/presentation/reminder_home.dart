import 'package:flutter/material.dart';

class MedicineReminderHome extends StatelessWidget {
  const MedicineReminderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('MediTime'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.timer)),
        ],
      ),
    );
  }
}
