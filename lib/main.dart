import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/pages/home.dart';
import 'package:time_tracker/pages/login.dart';
import 'package:time_tracker/pages/welcome.dart';
import 'package:time_tracker/store/tt.reducer.dart';
import 'package:time_tracker/store/tt.state.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<TimeTrackerState>(
      store: timeTrackerStore,
      child: MaterialApp(
        title: 'Time Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: TTFonts.primary),
        initialRoute: "/",
        routes: {
          "/": (context) => const Welcome(),
          "/form": (context) => const Login(),
          "/home": (context) => const Home()
        },
      ),

    );
  }
}
