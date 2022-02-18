import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Time Tracker', style: TextStyle(
          color: TTColors.primary
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
      ),
    );
  }
}