import 'package:redux/redux.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

final timeTrackerReducer = combineReducers<TimeTrackerState>([
  TypedReducer<TimeTrackerState, LogUser>(_LogUser),
  TypedReducer<TimeTrackerState, LogOutUser>(_LogOutUser)
]);

TimeTrackerState _LogUser(TimeTrackerState state, LogUser action) {
  String? error;

  if (action.user.pseudo == "") {
    error = "Can't log user";
  }

  return state.copyWith(user: action.user, error: error);
}

TimeTrackerState _LogOutUser(TimeTrackerState state, LogOutUser action) {
  String? error;
  UserModel? user;

  return state.copyWith(user: user, error: null);
}

final Store<TimeTrackerState> timeTrackerStore = Store<TimeTrackerState>(
    timeTrackerReducer,
    initialState: TimeTrackerState.initState());
