import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/app_bar_line.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TTAppBarLine(active: 1),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
        child: Stack(
          children: [
            const Text(
                "Manage\ntime more effectively",
                style: TextStyle(
                  fontFamily: TTFonts.secondary,
                  fontSize: 47,
                )
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("images/welcome-logo.png", width: 350),
            ),
            Positioned(
              bottom: 80,
              width: 190,
              child: TTButton(
                onPressed: () => Navigator.pushNamed(context, "/form"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Next", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        const SizedBox(width: 13, child: Icon(Icons.chevron_right, size: 30,)),
                        SizedBox(width: 13, child: Icon(Icons.chevron_right, color: Colors.grey[400], size: 30)),
                        SizedBox(width: 25, child: Icon(Icons.chevron_right, color: Colors.grey[500], size: 30)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}