import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/nav_bar_icon.dart';

class TTNavBar extends StatefulWidget {
  final List<Map> navigationLayouts;
  final Function callback;

  const TTNavBar(
      {Key? key, required this.navigationLayouts, required this.callback})
      : super(key: key);

  @override
  _TTNavBarState createState() => _TTNavBarState();
}

class _TTNavBarState extends State<TTNavBar> {
  int currentIndex = 0;

  bool indexIsEqualToCurrentIndex(int index) {
    return currentIndex == index;
  }

  int get _getNavigationLayoutsLength => widget.navigationLayouts.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: const BoxDecoration(
          color: TTColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TTBorderRadius.normal),
              topRight: Radius.circular(TTBorderRadius.normal))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...widget.navigationLayouts.map((item) {
            int index = widget.navigationLayouts.indexOf(item);

            return TTNavBarIcon(
                icon: item['icon'],
                opacity: indexIsEqualToCurrentIndex(index) ? 1.0 : 0.5,
                onPressed: () => setState(() {
                      currentIndex = index;
                      widget.callback(currentIndex);
                    }));
          }).toList(),
          TTNavBarIcon(
              icon: Icons.person_rounded,
              opacity: indexIsEqualToCurrentIndex(_getNavigationLayoutsLength)
                  ? 1.0
                  : 0.5,
              onPressed: () => setState(() {
                    currentIndex = _getNavigationLayoutsLength;
                    Navigator.pushNamed(context, '/user-settings');
                  })),
        ],
      ),
    );
  }
}
