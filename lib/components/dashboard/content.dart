import 'package:flutter/material.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dashboard/task_card.dart';
import 'package:time_tracker/models/task.model.dart';

class TTDashBoardContent extends StatelessWidget {
  final List<TaskModel> tasks;
  List<Widget> _listItems = <Widget>[];
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  TTDashBoardContent({Key? key, required this.tasks}) : super(key: key);

  void _loadItems() {
    var future = Future(() {});
    _listItems = <Widget>[];
    _listKey = GlobalKey<AnimatedListState>();

    for (int i = 0; i < tasks.length; i++) {
      future = future
          .then((_) => Future.delayed(const Duration(milliseconds: 200), () {
                TaskModel _task = tasks[i];

                _listItems.add(TTDashBoardTaskCard(task: _task));

                _listKey.currentState?.insertItem(_listItems.length - 1,
                    duration: const Duration(milliseconds: 500));
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadItems();

    return Expanded(
      child: TTContainer(
        width: 300,
        height: double.infinity,
        marginHorizontal: 0,
        marginVertical: 0,
        child: AnimatedList(
          key: _listKey,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index, animation) {
            return FadeTransition(
              opacity: animation.drive(Tween<double>(begin: 0.0, end: 1)),
              child: SlideTransition(
                position:
                    CurvedAnimation(curve: Curves.easeOut, parent: animation)
                        .drive(Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: const Offset(0, 0))),
                child: _listItems[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
