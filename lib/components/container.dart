import 'package:flutter/material.dart';

class TTContainer extends StatelessWidget {
  final double marginHorizontal;
  final double marginVertical;
  final double width;
  final double height;
  final Widget child;

  const TTContainer(
      {Key? key,
      this.marginHorizontal = 30,
      this.marginVertical = 30,
      this.width = 400,
      this.height = 350,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal, vertical: marginVertical),
      width: width,
      height: height,
      child: child,
    );
  }
}
