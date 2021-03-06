import 'package:flutter/material.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/utils/date.dart';

@immutable
class TimeTrackerState {
  final UserModel? user;
  final List<TaskModel> tasks;
  final String daySelected;
  final String? error;

  const TimeTrackerState(
      {required this.user,
      required this.tasks,
      required this.daySelected,
      this.error});

  factory TimeTrackerState.initState() {
    return TimeTrackerState(
        user: null,
        tasks: const [],
        daySelected: getCurrentFormattedDay(),
        error: null);
  }

  TimeTrackerState copyWith(
      {UserModel? user,
      List<TaskModel>? tasks,
      String? daySelected,
      String? error}) {
    return TimeTrackerState(
        user: user ?? this.user,
        tasks: tasks ?? this.tasks,
        daySelected: daySelected ?? this.daySelected,
        error: error);
  }
}
