import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTButton extends StatelessWidget {
  double width;
  double height;
  double padding;
  double borderRadius;
  Color backgroundColor;
  Widget child;
  void Function() onPressed;

  TTButton(
      {Key? key,
      required this.child,
      this.width = 140,
      this.height = 50,
      this.padding = 18,
      this.borderRadius = 22,
      this.backgroundColor = TTColors.primary,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(padding)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    side: BorderSide(color: backgroundColor)))),
      ),
    );
  }
}
