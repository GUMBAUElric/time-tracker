import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/store/tt.state.dart';
import 'package:time_tracker/utils/date.dart';

class TTDashboard extends StatelessWidget {
  final String currentDate = getDashBoardDate();

  TTDashboard({Key? key}) : super(key: key);

  List<TaskModel> getTasksByCurrentDay(List<TaskModel> tasks) {
    String _currentDay = getCurrentDate().split("/")[0];

    return tasks
        .where((task) => task.date.split("/")[0] == _currentDay)
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
          marginHorizontal: 19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentDate,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  TTButton(
                      child: Text(
                          _tasks.length > 1
                              ? "${_tasks.length} tasks"
                              : "${_tasks.length} task",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      padding: 2,
                      width: 90,
                      height: 38)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
