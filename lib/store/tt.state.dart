import 'package:flutter/cupertino.dart';
import 'package:time_tracker/models/user.model.dart';

@immutable
class TimeTrackerState {
  UserModel? user;
  String? error;

  TimeTrackerState({ required this.user, this.error });

  factory TimeTrackerState.initState() {
    return TimeTrackerState(user: null, error: null);
  }

  TimeTrackerState copyWith({ UserModel? user, String? error }) {
    return TimeTrackerState(
      user: user ?? this.user,
      error: error
    );
  }
}