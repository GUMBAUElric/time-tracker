import 'package:redux/redux.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';
import 'package:time_tracker/utils/date.dart';

final timeTrackerReducer = combineReducers<TimeTrackerState>([
  TypedReducer<TimeTrackerState, LogInUser>(_LogInUser),
  TypedReducer<TimeTrackerState, LogOutUser>(_LogOutUser),
  TypedReducer<TimeTrackerState, AddTask>(_AddTask),
  TypedReducer<TimeTrackerState, UpdateTask>(_UpdateTask),
  TypedReducer<TimeTrackerState, DeleteTask>(_DeleteTask),
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
  return state.copyWith(
      user: null,
      tasks: const [],
      daySelected: getCurrentFormattedDay(),
      error: null);
}

TimeTrackerState _AddTask(TimeTrackerState state, AddTask action) {
  List<TaskModel> _tasks = [...state.tasks, action.task];

  return state.copyWith(tasks: _tasks);
}

TimeTrackerState _UpdateTask(TimeTrackerState state, UpdateTask action) {
  List<TaskModel> _tasks = [...state.tasks];
  TaskModel _taskUpdated = action.taskUpdated;

  int index = _tasks.indexOf(_taskUpdated);

  _tasks[index] = _taskUpdated;

  return state.copyWith(tasks: _tasks);
}

TimeTrackerState _DeleteTask(TimeTrackerState state, DeleteTask action) {
  List<TaskModel> tasks = [...state.tasks];

  tasks.remove(action.task);

  return state.copyWith(tasks: tasks);
}

TimeTrackerState _SetDaySelected(
    TimeTrackerState state, SetDaySelected action) {
  return state.copyWith(daySelected: action.daySelected);
}

final Store<TimeTrackerState> timeTrackerStore = Store<TimeTrackerState>(
    timeTrackerReducer,
    initialState: TimeTrackerState.initState());
