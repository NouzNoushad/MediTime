import 'package:hive/hive.dart';

part 'reminder.g.dart';

@HiveType(typeId: 0)
class Reminder extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String dosage;
  @HiveField(2)
  String date;
  @HiveField(3)
  String hour;
  @HiveField(4)
  String type;
  @HiveField(5)
  String id;
  @HiveField(6)
  String image;

  Reminder(this.name, this.date, this.dosage, this.hour, this.type, this.id, this.image);
}
