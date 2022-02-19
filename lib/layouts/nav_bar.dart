import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTNavBar extends StatefulWidget {
  final Function callback;

  const TTNavBar({Key? key, required this.callback}) : super(key: key);

  @override
  _TTNavBarState createState() => _TTNavBarState();
}

class _TTNavBarState extends State<TTNavBar> {
  int currentIndex = 0;

  List <IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.add_rounded,
  ];

  bool indexIsEqualToCurrentIndex(int index) {
    return currentIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
          color: TTColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TTBorderRadius.normal),
              topRight: Radius.circular(TTBorderRadius.normal)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...listOfIcons.map<Widget>((icon) {
          int index = listOfIcons.indexOf(icon);

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: indexIsEqualToCurrentIndex(index) ? 1.0 : 0.5,
            child: IconButton(
              icon: Icon(icon),
              iconSize: 30,
              color:  Colors.white,
              onPressed: () => setState(() {
                currentIndex = index;
                widget.callback(currentIndex);
              }),
              ),
            );
        }).toList(),
         AnimatedOpacity(
           opacity: indexIsEqualToCurrentIndex(2) ? 1.0 : 0.5,
           duration: const Duration(milliseconds: 200),
           child:  IconButton(
             icon: const Icon(Icons.person_rounded),
             iconSize: 30,
             color: Colors.white,
             onPressed: () => setState(() {
               currentIndex = listOfIcons.length;
               // TODO : Push navigation to user settings
             }),
           ),
         )
        ],
      ),
    );
  }
}

