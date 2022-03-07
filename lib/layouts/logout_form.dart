import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/dialog.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

class TTLogoutForm extends StatelessWidget {
  const TTLogoutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<TimeTrackerState>(
      builder: (BuildContext context, Store<TimeTrackerState> store) {
        UserModel? user = store.state.user;

        return TTContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                user!.pseudo,
                style: const TextStyle(
                    fontSize: 23, fontFamily: TTFonts.secondary),
              ),
              TTButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Logout", style: TextStyle(fontSize: 18)),
                      Icon(
                        Icons.logout_rounded,
                        size: 19,
                      )
                    ],
                  ),
                  backgroundColor: TTColors.tertiary,
                  onPressed: () {
                    TTDialog(context: context, actions: [
                      CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.pop(context)),
                      CupertinoDialogAction(
                          child: const Text("Yes"),
                          onPressed: () {
                            store.dispatch(LogOutUser());

                            Navigator.pushNamedAndRemoveUntil(
                                context, "/", (route) => false);
                          }),
                    ]).show();
                  }),
              Text(
                "Last connection : ${user.connectedAt}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
