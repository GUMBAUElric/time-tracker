import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';
import 'package:time_tracker/components/nav_bar_icon.dart';
import 'package:time_tracker/router/home_navigation_router.dart';

class TTNavBar extends StatefulWidget {
  const TTNavBar({Key? key}) : super(key: key);

  @override
  _TTNavBarState createState() => _TTNavBarState();
}

class _TTNavBarState extends State<TTNavBar> {
  List<IconData> navigationIcons = homeNavigationRouter.navigationIcons;

  bool indexIsEqualToCurrentIndex(int index) {
    return homeNavigationRouter.currentRoute == index;
  }

  int get _getNavigationLayoutsLength => navigationIcons.length;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      homeNavigationRouter.addListener(() {
        if (!mounted) return;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    homeNavigationRouter.removeListener(() {});
  }

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
          ...navigationIcons.map((item) {
            int index = navigationIcons.indexOf(item);

            return TTNavBarIcon(
                icon: item,
                opacity: indexIsEqualToCurrentIndex(index) ? 1.0 : 0.5,
                onPressed: () => homeNavigationRouter.navigateToPage(index));
          }).toList(),
          TTNavBarIcon(
              icon: Icons.person_rounded,
              opacity: indexIsEqualToCurrentIndex(_getNavigationLayoutsLength)
                  ? 1.0
                  : 0.5,
              onPressed: () => Navigator.pushNamed(context, '/user-settings')),
        ],
      ),
    );
  }
}
