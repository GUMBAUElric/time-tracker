import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/models/task.model.dart';

class TTDashBoardContent extends StatelessWidget {
  final List<TaskModel> tasks;
  List<Widget> _listItems = <Widget>[];
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  TTDashBoardContent({Key? key, required this.tasks}) : super(key: key);

  Color? getColorCard(String priority) {
    if (priority == "High") {
      return TTColors.tertiary;
    } else if (priority == "Middle") {
      return TTColors.secondary;
    } else {
      return Colors.white.withOpacity(0.5);
    }
  }

  void _loadItems() {
    var future = Future(() {});
    _listItems = <Widget>[];
    _listKey = GlobalKey<AnimatedListState>();

    for (int i = 0; i < tasks.length; i++) {
      future = future
          .then((_) => Future.delayed(const Duration(milliseconds: 200), () {
                TaskModel _task = tasks[i];

                _listItems.add(Card(
                  color: getColorCard(_task.priority),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () => print('card pressed !'),
                    child: TTContainer(
                      width: double.infinity,
                      height: 80,
                      marginVertical: 10,
                      marginHorizontal: 10,
                      child: Center(child: Text(_task.name)),
                    ),
                  ),
                ));

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
