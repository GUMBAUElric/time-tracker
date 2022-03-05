import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/layouts/app_bar.dart';
import 'package:time_tracker/layouts/nav_bar.dart';
import 'package:time_tracker/router/router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const TTAppBar(
        title: Text('Time Tracker', style: TextStyle(color: TTColors.primary)),
        leading: Icon(Icons.notifications_rounded,
            color: TTColors.primary, size: 25),
      ),
      body: router.buildNavigation(),
      bottomNavigationBar: const TTNavBar(),
    );
  }
}
