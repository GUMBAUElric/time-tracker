import 'package:flutter/material.dart';
import 'package:time_tracker/components/app_bar_line.dart';
import 'package:time_tracker/layouts/app_bar.dart';
import 'package:time_tracker/layouts/login_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TTAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TTAppBarLine(active: 2),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: const TTLoginForm());
  }
}
