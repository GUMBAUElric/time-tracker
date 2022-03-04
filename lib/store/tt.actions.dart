import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/models/user.model.dart';

class LogInUser {
  UserModel user;

  LogInUser({required this.user});
}

class LogOutUser {
  LogOutUser();
}

class AddTask {
  TaskModel task;

  AddTask({required this.task});
}

class SetDaySelected {
  String daySelected;

  SetDaySelected({required this.daySelected});
}
