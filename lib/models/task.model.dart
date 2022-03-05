class TaskModel {
  final String id;
  late String name;
  late String priority;
  late String date;
  late String startTime;
  late String endTime;
  List<Map<String, String>> persons;

  TaskModel(
      {required this.name,
      required this.priority,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.persons,
      required this.id});
}
