import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dashboard/content.dart';
import 'package:time_tracker/components/dashboard/header.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/store/tt.selectors.dart';
import 'package:time_tracker/store/tt.state.dart';

class TTDashboard extends StatelessWidget {
  const TTDashboard({Key? key}) : super(key: key);

  List<TaskModel> getTasksByCurrentDay(List<TaskModel> tasks) {
    return tasks
        .where((task) => task.date.split("/")[0] == getDaySelected())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<TimeTrackerState> store) {
        TimeTrackerState _state = store.state;
        List<TaskModel> _tasks = getTasksByCurrentDay(_state.tasks);

        return TTContainer(
          height: double.infinity,
          width: 700,
          marginHorizontal: 19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TTDashBoardHeader(numberOfTasks: _tasks.length),
              TTDashBoardContent(tasks: _tasks)
            ],
          ),
        );
      },
    );
  }
}
