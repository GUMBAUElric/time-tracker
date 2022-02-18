import 'package:flutter/material.dart';

class TTAppBarLine extends StatelessWidget {
  int active;

  TTAppBarLine({Key? key, required this.active }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: active == 1 ? 40 : 15,
          height: 5,
          decoration: BoxDecoration(
            color: active == 1 ? const Color(0xff2a2a2a) : Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: active == 1 ? 15 : 40,
          height: 5,
          decoration: BoxDecoration(
            color: active == 1 ? Colors.grey[350] : const Color(0xff2a2a2a),
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }
}