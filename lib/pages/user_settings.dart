import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/layouts/app_bar.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TTAppBar(
        title: Text("Settings", style: TextStyle(color: TTColors.primary)),
      ),
      body: Container(
        color: Colors.white,
        child: const Text("User Settings page :)"),
      ),
    );
  }
}
