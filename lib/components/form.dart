import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/button.dart';
import 'package:time_tracker/models/user.model.dart';
import 'package:time_tracker/store/tt.actions.dart';
import 'package:time_tracker/store/tt.state.dart';

class TTForm extends StatefulWidget {

  TTForm({Key? key}) : super(key: key);

  @override
  _TTFormState createState() => _TTFormState();
}

class _TTFormState extends State<TTForm> {
  final TextEditingController _pseudoController = TextEditingController();
  late UserModel user;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<TimeTrackerState>(
      builder: (BuildContext context, Store<TimeTrackerState> store) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "Hello 👋",
                  style: TextStyle(
                    fontFamily: TTFonts.secondary,
                    fontSize: 45,
                  )
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _pseudoController,
                autocorrect: false,
                validator: (val) => val!.isEmpty ? "Pseudo invalide !" : null,
                cursorColor: TTColors.primary,
                style: const TextStyle(
                    color: TTColors.primary,
                    fontSize: 16
                ),
                decoration: InputDecoration(
                  labelText: "Pseudo",
                  labelStyle: const TextStyle(color: TTColors.primary),
                  hintText: "Cho7du67",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: TTColors.primary)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: TTColors.primary)
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 180,
                height: 50,
                child: TTButton(
                  padding: 10,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      user = UserModel(pseudo: _pseudoController.text);
                      store.dispatch(LogUser(user: user));
                      Navigator.pushNamed(context, "/home");
                    }
                  },
                  child: const Text("Login", style: TextStyle(
                      fontSize: 16
                  )),
                ),
              )
            ],
          ),
        );
      });
  }
}