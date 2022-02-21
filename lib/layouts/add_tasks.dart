import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dropdown.dart';
import 'package:time_tracker/components/input.dart';
import 'package:time_tracker/store/tt.state.dart';
import 'package:time_tracker/utils/date.dart';
import 'package:time_tracker/utils/picker.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();

  String date = getCurrentDate();
  String startTime = getCurrentTime();
  String endTime = getCurrentTime();

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    final TextEditingController _startTimeController = TextEditingController();
    final TextEditingController _endTimeController = TextEditingController();

    _dateController.text = date;
    _startTimeController.text = startTime;
    _endTimeController.text = endTime;

    return StoreBuilder(
      builder: (BuildContext context, Store<TimeTrackerState> store) {
        return TTContainer(
          height: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Add Task",
                    style:
                        TextStyle(fontSize: 19, fontFamily: TTFonts.secondary)),
                TTInput(
                  controller: _taskNameController,
                  validator: (val) => val!.isEmpty ? "Wrong task name !" : null,
                  labelText: "Task name",
                  hintText: "My superb task 🚀",
                ),
                TTDropdown(
                    validator: (val) =>
                        val == null ? "Wrong task priority !" : null,
                    hintText: "Priority",
                    labelText: "Priority",
                    dropDownItems: const ['Low', 'Middle', 'High'],
                    dropDownItemsColors: (val) {
                      if (val == "Low") return TTColors.secondary;
                      if (val == "High") return TTColors.tertiary;
                      return TTColors.primary;
                    }),
                TTInput(
                  controller: _dateController,
                  validator: (val) => null,
                  labelText: 'Date',
                  readOnly: true,
                  textAlign: TextAlign.center,
                  onTap: () async {
                    DateTime? newDate =
                        await TTDatePicker(context: context).show();

                    if (newDate == null) return;

                    setState(() => date =
                        DateFormat('dd/MM/yyyy').format(newDate).toString());
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TTContainer(
                        width: 110,
                        height: 50,
                        child: TTInput(
                          labelText: "Start time",
                          readOnly: true,
                          textAlign: TextAlign.center,
                          controller: _startTimeController,
                          validator: (val) => null,
                          onTap: () async {
                            TimeOfDay? newStartTime =
                                await TTTimePicker(context: context).show();

                            if (newStartTime == null) return;

                            setState(() => startTime =
                                newStartTime.format(context).toString());
                          },
                        )),
                    TTContainer(
                        width: 100,
                        height: 50,
                        child: TTInput(
                          labelText: "End time",
                          readOnly: true,
                          textAlign: TextAlign.center,
                          controller: _endTimeController,
                          validator: (val) => null,
                          onTap: () async {
                            TimeOfDay? newEndTime =
                                await TTTimePicker(context: context).show();

                            if (newEndTime == null) return;

                            setState(() => endTime =
                                newEndTime.format(context).toString());
                          },
                        ))
                  ],
                ),
                TTButton(
                  width: 100,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    if (!timeRangeIsValid(
                        _startTimeController.text, _endTimeController.text)) {
                      print("bad time range");
                      return;
                    }

                    print("Ok");
                  },
                  child: const Text("Ok", style: TextStyle(fontSize: 16)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
