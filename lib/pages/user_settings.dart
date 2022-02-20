import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/layouts/app_bar.dart';
import 'package:time_tracker/layouts/logout_form.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TTAppBar(
        title: SizedBox(
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Settings", style: TextStyle(color: TTColors.primary)),
              Icon(Icons.settings, color: TTColors.primary)
            ],
          ),
        ),
      ),
      body: const TTLogoutForm(),
    );
  }
}
