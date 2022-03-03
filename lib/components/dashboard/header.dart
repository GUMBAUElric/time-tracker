import 'package:flutter/material.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dashboard/date_slider.dart';
import 'package:time_tracker/utils/date.dart';

class TTDashBoardHeader extends StatelessWidget {
  final String currentDate = getDashBoardDate();
  final int numberOfTasks;

  TTDashBoardHeader({Key? key, required this.numberOfTasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TTContainer(
      width: double.infinity,
      marginHorizontal: 0,
      marginVertical: 0,
      child: Column(
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
                      numberOfTasks > 1
                          ? "$numberOfTasks tasks"
                          : "$numberOfTasks task",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  padding: 2,
                  width: 90,
                  height: 38),
            ],
          ),
          const TTDashBoardDateSlider()
        ],
      ),
    );
  }
}
