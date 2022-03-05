import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/layouts/app_bar.dart';
import 'package:time_tracker/layouts/handle_task.dart';
import 'package:time_tracker/models/task.model.dart';

class EditTask extends StatelessWidget {
  final TaskModel taskToUpdate;

  const EditTask({Key? key, required this.taskToUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TTAppBar(
        title: SizedBox(
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Edit Task", style: TextStyle(color: TTColors.primary)),
              Icon(Icons.edit, color: TTColors.primary)
            ],
          ),
        ),
      ),
      body: Center(
        child: TTHandleTasks(
            handleTasksType: HandleTasksType.updateTask,
            taskToUpdate: taskToUpdate),
      ),
    );
  }
}
