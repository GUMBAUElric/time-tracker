import 'package:flutter/cupertino.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/models/user.model.dart';

@immutable
class TimeTrackerState {
  late UserModel? user;
  late List<TaskModel> tasks;
  late String? error;

  TimeTrackerState({required this.user, required this.tasks, this.error});

  factory TimeTrackerState.initState() {
    return TimeTrackerState(user: null, tasks: const [], error: null);
  }

  TimeTrackerState copyWith(
      {UserModel? user, List<TaskModel>? tasks, String? error}) {
    return TimeTrackerState(
        user: user ?? this.user, tasks: tasks ?? this.tasks, error: error);
  }
}
