import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/nav_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Time Tracker', style: TextStyle(
          color: TTColors.primary
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
      ),
      bottomNavigationBar: TTNavBar(callback: (currentIndex) {
        print("index : $currentIndex");
      }),
    );
  }
}