import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/layout_slider.dart';
import 'package:time_tracker/layouts/nav_bar.dart';

class Home extends StatelessWidget {
  final List<Map> _navigationLayouts = [
    {"icon": Icons.home_rounded, "layout": const Text("Home")},
    {"icon": Icons.add_rounded, "layout": const Text("Add Tasks")}
  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LayoutSlider _layoutSlider =
        LayoutSlider(navigationLayouts: _navigationLayouts);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Time Tracker',
            style: TextStyle(color: TTColors.primary)),
        leading: const Icon(Icons.notifications_rounded,
            color: TTColors.primary, size: 25),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: _layoutSlider,
      ),
      bottomNavigationBar: TTNavBar(
          navigationLayouts: _navigationLayouts,
          callback: (currentIndex) => _layoutSlider.goToPage(currentIndex)),
    );
  }
}
