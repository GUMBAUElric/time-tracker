import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/components/container.dart';
import 'package:time_tracker/components/input.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

class TTLoginForm extends StatefulWidget {
  const TTLoginForm({Key? key}) : super(key: key);

  @override
  _TTLoginFormState createState() => _TTLoginFormState();
}

class _TTLoginFormState extends State<TTLoginForm> {
  final TextEditingController _pseudoController = TextEditingController();
  late UserModel user;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<TimeTrackerState>(
        builder: (BuildContext context, Store<TimeTrackerState> store) {
      return TTContainer(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Hello 👋",
                  style: TextStyle(
                    fontFamily: TTFonts.secondary,
                    fontSize: 45,
                  )),
              TTInput(
                controller: _pseudoController,
                validator: (val) => val!.isEmpty ? "Wrong pseudo !" : null,
                labelText: "Pseudo",
                hintText: "Cho7du67",
              ),
              TTButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  user = UserModel(pseudo: _pseudoController.text);
                  store.dispatch(LogInUser(user: user));
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                child: const Text("Login", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
