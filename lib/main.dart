import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/pages/home.dart';
import 'package:time_tracker/pages/login.dart';
import 'package:time_tracker/pages/user_settings.dart';
import 'package:time_tracker/pages/welcome.dart';
import 'package:time_tracker/store/tt.reducer.dart';
import 'package:time_tracker/store/tt.state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('en'), Locale('fr')],
          initialRoute: "/",
          routes: {
            '/': (context) => const Welcome(),
            '/form': (context) => const Login(),
            '/home': (context) => Home(),
            '/user-settings': (context) => const UserSettings()
          }),
    );
  }
}
