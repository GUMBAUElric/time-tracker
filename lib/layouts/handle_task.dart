import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dropdown.dart';
import 'package:time_tracker/components/input.dart';
import 'package:time_tracker/components/picker.dart';
import 'package:time_tracker/components/tag_input.dart';
import 'package:time_tracker/models/task.model.dart';
import 'package:time_tracker/router/router.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';
import 'package:time_tracker/utils/date.dart';
import 'package:time_tracker/utils/random_avatar.dart';

enum HandleTasksType { addTask, updateTask }

class TTHandleTasks extends StatefulWidget {
  final HandleTasksType handleTasksType;

  const TTHandleTasks({Key? key, required this.handleTasksType})
      : super(key: key);

  @override
  State<TTHandleTasks> createState() => _TTTTHandleTasksState();
}

class _TTTTHandleTasksState extends State<TTHandleTasks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  String _priority = "Low";
  List<String> _persons = [];
  UniqueKey _key = UniqueKey();

  @override
  void initState() {
    setDefault();
  }

  void setDefault() {
    setState(() {
      _taskNameController.text = "";
      _priority = "Low";
      _dateController.text = getCurrentDate();
      _startTimeController.text = getCurrentTime();
      _endTimeController.text = getCurrentTime();
      _persons = [];
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  defaultValue: _priority,
                  dropDownItemsColors: (val) {
                    if (val == "Low") return TTColors.secondary;
                    if (val == "High") return TTColors.tertiary;
                    return TTColors.primary;
                  },
                  callBack: (selectedPriority) =>
                      setState(() => _priority = selectedPriority),
                ),
                TTTagInput(
                  key: _key,
                  tags: _persons,
                ),
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

                    setState(() => _dateController.text =
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

                            setState(() => _startTimeController.text =
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

                            setState(() => _endTimeController.text =
                                newEndTime.format(context).toString());
                          },
                        ))
                  ],
                ),
                TTButton(
                  width: 100,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    String name = _taskNameController.text;
                    String date = _dateController.text;
                    String startTime = _startTimeController.text;
                    String endTime = _endTimeController.text;
                    List<Map<String, String>> persons = _persons
                        .map((_person) =>
                            {"name": _person, "avatar": randomAvatar()})
                        .toList();

                    if (!timeRangeIsValid(startTime, endTime)) {
                      Fluttertoast.showToast(
                          msg: "Bad time range",
                          gravity: ToastGravity.TOP,
                          backgroundColor: TTColors.tertiary,
                          timeInSecForIosWeb: 3);
                      return;
                    }

                    await store.dispatch(AddTask(
                        task: TaskModel(
                            name: name,
                            priority: _priority,
                            date: date,
                            startTime: startTime,
                            endTime: endTime,
                            persons: persons)));

                    setDefault();
                    router.navigateToPage(0);
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
