import 'package:flutter/material.dart';

class TTNavBarIcon extends StatelessWidget {
  final IconData icon;
  final double opacity;
  final Function onPressed;

  const TTNavBarIcon(
      {Key? key,
      required this.icon,
      required this.opacity,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: opacity,
      child: IconButton(
          icon: Icon(icon),
          iconSize: 30,
          color: Colors.white,
          onPressed: () => onPressed()),
    );
  }
}
