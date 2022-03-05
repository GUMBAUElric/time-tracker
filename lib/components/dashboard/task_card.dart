import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/pages/edit_task.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.reducer.dart';

class TTDashBoardTaskCard extends StatelessWidget {
  final TaskModel task;
  final List<Widget> _avatars = [];

  TTDashBoardTaskCard({Key? key, required this.task}) : super(key: key);

  Color getColorCard(String priority) {
    if (priority == "High") {
      return TTColors.tertiary;
    } else if (priority == "Middle") {
      return TTColors.primary;
    } else {
      return TTColors.secondary;
    }
  }

  List<Widget> getAvatars() {
    if (task.persons.isEmpty) return _avatars;
    int _length = 1;

    if (task.persons.length >= 2) _length = 2;

    for (int i = 0; i < _length; i++) {
      _avatars.add(Positioned(
        left: (i == 0) ? 0 : 25,
        child: CircleAvatar(
          backgroundImage: NetworkImage(task.persons[i]['avatar']!),
        ),
      ));
    }

    if (task.persons.length <= 2) return _avatars;

    _avatars.add(Positioned(
      left: 50,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.7),
        child: Text(
          "${task.persons.length - 2}+",
          style: const TextStyle(color: TTColors.primary),
        ),
      ),
    ));

    return _avatars;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.55,
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: const EditTask()));
            },
            foregroundColor: TTColors.secondary,
            icon: Icons.edit,
            label: 'Edit',
            spacing: 1.0,
          ),
          SlidableAction(
            onPressed: (BuildContext context) =>
                timeTrackerStore.dispatch(DeleteTask(task: task)),
            foregroundColor: TTColors.tertiary,
            icon: Icons.delete,
            label: 'Delete',
            spacing: 1.0,
          ),
        ],
      ),
      child: Card(
        color: getColorCard(task.priority),
        margin: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TTContainer(
          width: double.infinity,
          height: 100,
          marginVertical: 10,
          marginHorizontal: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  TTButton(
                    child: Text(
                      task.priority,
                      style: const TextStyle(color: TTColors.primary),
                    ),
                    width: 70,
                    height: 30,
                    padding: 0,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TTContainer(
                    width: 150,
                    height: 50,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: getAvatars(),
                    ),
                  ),
                  Text("${task.startTime} - ${task.endTime}",
                      style: const TextStyle(color: Colors.white, fontSize: 15))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
