import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTDatePicker {
  final BuildContext context;

  TTDatePicker({required this.context});

  Future<DateTime?> show() async {
    return await showDatePicker(
        context: context,
        locale: const Locale("fr", "FR"),
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300),
        builder: (_, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                primary: TTColors.primary,
                onPrimary: Colors.white,
                surface: TTColors.primary,
                onSurface: TTColors.primary,
              )),
              child: child!);
        });
  }
}

class TTTimePicker {
  final BuildContext context;

  TTTimePicker({required this.context});

  Future<TimeOfDay?> show() async {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (_, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                primary: TTColors.primary,
                onPrimary: Colors.white,
                surface: Colors.white,
              )),
              child: child!);
        });
  }
}
