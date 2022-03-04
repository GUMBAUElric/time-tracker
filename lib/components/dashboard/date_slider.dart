import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.reducer.dart';
import 'package:time_tracker/utils/date.dart';

class TTDashBoardDateSlider extends StatefulWidget {
  const TTDashBoardDateSlider({Key? key}) : super(key: key);

  @override
  State<TTDashBoardDateSlider> createState() => _TTDashBoardDateSliderState();
}

class _TTDashBoardDateSliderState extends State<TTDashBoardDateSlider> {
  final itemController = ItemScrollController();
  late int currentIndex = 0;
  final List<Map> _days = getMonthDays();

  @override
  void initState() {
    setDefaultSelectedDate();
  }

  void setDefaultSelectedDate() {
    currentIndex = getCurrentDay() - 1;

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => itemController.jumpTo(index: currentIndex));
  }

  @override
  Widget build(BuildContext context) {
    return TTContainer(
      width: double.infinity,
      marginHorizontal: 0,
      height: 70,
      child: ScrollablePositionedList.builder(
        itemScrollController: itemController,
        itemCount: _days.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              late String _daySelected;

              _daySelected = (index < 9) ? "0${index + 1}" : "${index + 1}";

              await timeTrackerStore
                  .dispatch(SetDaySelected(daySelected: _daySelected));

              setState(() => currentIndex = index);
            },
            child: Container(
                decoration: (index == currentIndex)
                    ? BoxDecoration(
                        border: Border.all(color: TTColors.primary),
                        borderRadius: BorderRadius.circular(10))
                    : null,
                width: 50,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_days[index]["dayNumber"],
                        style: TextStyle(
                            color: (index == currentIndex)
                                ? TTColors.primary
                                : TTColors.primary.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(_days[index]["dayName"],
                        style: TextStyle(
                            color: (index == currentIndex)
                                ? TTColors.primary
                                : TTColors.primary.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          );
        },
      ),
    );
  }
}
