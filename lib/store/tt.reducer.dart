import 'package:redux/redux.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

final timeTrackerReducer = combineReducers<TimeTrackerState>([
  TypedReducer<TimeTrackerState, LogInUser>(_LogInUser),
  TypedReducer<TimeTrackerState, LogOutUser>(_LogOutUser),
  TypedReducer<TimeTrackerState, AddTask>(_AddTask),
  TypedReducer<TimeTrackerState, SetDaySelected>(_SetDaySelected),
]);

TimeTrackerState _LogInUser(TimeTrackerState state, LogInUser action) {
  String? error;

  if (action.user.pseudo == "") {
    error = "Can't log user";
  }

  return state.copyWith(user: action.user, error: error);
}

TimeTrackerState _LogOutUser(TimeTrackerState state, LogOutUser action) {
  UserModel? user;

  return state.copyWith(user: user);
}

TimeTrackerState _AddTask(TimeTrackerState state, AddTask action) {
  List<TaskModel> tasks = [...state.tasks, action.task];

  return state.copyWith(tasks: tasks);
}

TimeTrackerState _SetDaySelected(
    TimeTrackerState state, SetDaySelected action) {
  return state.copyWith(daySelected: action.daySelected);
}

final Store<TimeTrackerState> timeTrackerStore = Store<TimeTrackerState>(
    timeTrackerReducer,
    initialState: TimeTrackerState.initState());
