import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TTDialog {
  final BuildContext context;
  final Widget? title;
  final List<CupertinoDialogAction> actions;

  TTDialog({required this.context, this.title, required this.actions});

  Future show() {
    return showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: title ?? const Text('Are you sure ?'),
              actions: actions,
            ));
  }
}
