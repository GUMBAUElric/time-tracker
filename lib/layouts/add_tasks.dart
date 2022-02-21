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
import 'package:time_tracker/utils/date_picker.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();

  // Get current date
  String selectedDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    _dateController.text = selectedDate;

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
                  onTap: () async {
                    DateTime? newDate =
                        await TTDatePicker(context: context).show();

                    if (newDate == null) return;

                    setState(() => selectedDate =
                        DateFormat('dd/MM/yyyy').format(newDate).toString());
                  },
                ),
                TTButton(
                  width: 100,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    print('Button pressed');
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
