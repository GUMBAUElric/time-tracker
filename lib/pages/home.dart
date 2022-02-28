import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/layouts/app_bar.dart';
import 'package:time_tracker/layouts/nav_bar.dart';
import 'package:time_tracker/router/home_navigation_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TTAppBar(
        title: Text('Time Tracker', style: TextStyle(color: TTColors.primary)),
        leading: Icon(Icons.notifications_rounded,
            color: TTColors.primary, size: 25),
      ),
      body: homeNavigationRouter.buildNavigation(),
      bottomNavigationBar: TTNavBar(
          navigationIcons: homeNavigationRouter.navigationIcons,
          callback: (currentIndex) =>
              homeNavigationRouter.navigateToPage(currentIndex)),
    );
  }
}
