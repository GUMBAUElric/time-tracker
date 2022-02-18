import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

final timeTrackerReducer = combineReducers<TimeTrackerState>([
  TypedReducer<TimeTrackerState, LogUser>(_LogUser)
]);

TimeTrackerState _LogUser(TimeTrackerState state, LogUser action) {
  String? error;

  if (action.user.pseudo == "") {
    error = "Can't log user";
  }

  return state.copyWith(user: action.user, error: error);
}

final Store<TimeTrackerState> timeTrackerStore = Store<TimeTrackerState>(timeTrackerReducer, initialState: TimeTrackerState.initState());