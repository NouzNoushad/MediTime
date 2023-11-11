import 'package:medicine_reminder_app/features/data/model/reminder_model.dart';
import 'package:medicine_reminder_app/features/domain/entity/reminder.dart';

import 'mapper.dart';

class ReminderMapper extends Mapper<ReminderModel, Reminder> {
  @override
  ReminderModel fromEntity(Reminder entity) =>
      ReminderModel(entity.name, entity.date, entity.dosage, entity.hour, entity.type, entity.id, entity.image);

  @override
  Reminder toEntity(ReminderModel model)  => Reminder(model.name,
      model.date, model.dosage, model.hour, model.type, model.id, model.image);
}
