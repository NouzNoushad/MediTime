import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/config/routes/route_constants.dart';
import 'package:medicine_reminder_app/core/utils/extensions.dart';
import 'package:medicine_reminder_app/features/presentation/cubit/storage/storage_cubit.dart';
import 'package:medicine_reminder_app/features/presentation/widgets/app_bar.dart';
import 'package:medicine_reminder_app/core/utils/strings.dart';

class MedicineReminderHome extends StatefulWidget {
  const MedicineReminderHome({super.key});

  @override
  State<MedicineReminderHome> createState() => _MedicineReminderHomeState();
}

class _MedicineReminderHomeState extends State<MedicineReminderHome> {
  @override
  void initState() {
    context.read<StorageCubit>().getStorageEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: AppStrings.appTitle,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.add);
              },
              icon: const Icon(Icons.timer)),
        ],
      ),
      body: BlocBuilder<StorageCubit, StorageState>(
        builder: (context, state) {
          if (state is StorageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StorageLoadedState) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                physics: const BouncingScrollPhysics(),
                itemCount: state.reminders.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  var medicine = state.reminders[index];
                  return Column(
                    children: [
                      Image.asset(
                        'assets/${medicine.image}',
                        height: context.height * 0.06,
                      ),
                      Text(medicine.name)
                    ],
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
