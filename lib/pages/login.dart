import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/app_bar_line.dart';
import 'package:time_tracker/components/form.dart';
import 'package:time_tracker/store/tt.state.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: TTColors.secondary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TTAppBarLine(active: 2),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: TTForm()
        ),
      );
  }
}