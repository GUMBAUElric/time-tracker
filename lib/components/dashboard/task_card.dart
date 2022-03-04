import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/models/task.model.dart';

class TTDashBoardTaskCard extends StatelessWidget {
  final TaskModel task;

  const TTDashBoardTaskCard({Key? key, required this.task}) : super(key: key);

  Color getColorCard(String priority) {
    if (priority == "High") {
      return TTColors.tertiary;
    } else if (priority == "Middle") {
      return TTColors.primary;
    } else {
      return TTColors.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColorCard(task.priority),
      margin: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => print('card pressed !'),
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
                      children: const [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/01/15/07/51/woman-3083379_960_720.jpg'),
                        ),
                        Positioned(
                          left: 25,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056__340.jpg'),
                          ),
                        ),
                        /*Positioned(
                          left: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: Text(
                              "3+",
                              style: TextStyle(color: TTColors.primary),
                            ),
                          ),
                        )*/
                      ],
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
