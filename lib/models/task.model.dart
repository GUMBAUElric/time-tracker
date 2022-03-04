import 'package:uuid/uuid.dart';

class TaskModel {
  final String id = const Uuid().v4();
  final String name;
  final String priority;
  final String date;
  final String startTime;
  final String endTime;
  List<Map<String, String>> persons;

  TaskModel(
      {required this.name,
      required this.priority,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.persons});
}
