import 'package:time_tracker/store/tt.reducer.dart';
import 'package:time_tracker/store/tt.state.dart';

String getDaySelected() {
  TimeTrackerState _state = timeTrackerStore.state;
  return _state.daySelected;
}
