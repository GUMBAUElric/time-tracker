import 'package:uuid/uuid.dart';

class TaskModel {
  late String id = const Uuid().v4();
  late String name;
  late String priority;
  late String date;
  late String startTime;
  late String endTime;

  TaskModel(
      {required this.name,
      required this.priority,
      required this.date,
      required this.startTime,
      required this.endTime});
}
