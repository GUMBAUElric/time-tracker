import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTButton extends StatelessWidget {
  double padding;
  double borderRadius;
  Widget child;
  void Function() onPressed;

  TTButton({
    Key? key,
    required this.child,
    this.padding = 20,
    this.borderRadius = 20,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(padding)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(TTColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: const BorderSide(color: TTColors.primary)
              )
          )
      ),
    );
  }
}