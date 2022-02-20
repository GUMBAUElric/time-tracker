import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/app_bar_line.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/layouts/app_bar.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TTAppBar(
        showLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TTAppBarLine(active: 1),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 28),
              child: const Text("Manage\ntime more\neffectively",
                  style: TextStyle(
                    fontFamily: TTFonts.secondary,
                    fontSize: 45,
                  )),
            ),
            Image.asset("images/welcome-logo.png"),
            Container(
              margin: const EdgeInsets.only(left: 28, bottom: 50),
              child: TTButton(
                width: 180,
                height: 65,
                padding: 18,
                onPressed: () => Navigator.pushNamed(context, "/form"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Next", style: TextStyle(fontSize: 19)),
                    Row(
                      children: [
                        const SizedBox(
                            width: 13,
                            child: Icon(Icons.chevron_right, size: 30)),
                        SizedBox(
                            width: 13,
                            child: Icon(Icons.chevron_right,
                                color: Colors.grey[400], size: 30)),
                        SizedBox(
                            width: 25,
                            child: Icon(Icons.chevron_right,
                                color: Colors.grey[500], size: 30)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
