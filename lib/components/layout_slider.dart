import 'package:flutter/material.dart';

class LayoutSlider extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Map> navigationLayouts;

  LayoutSlider({Key? key, required this.navigationLayouts}) : super(key: key);

  void goToPage(int index) {
    if (index < 0) index = 0;

    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: navigationLayouts.length,
      itemBuilder: (context, i) =>
          Center(child: navigationLayouts[i]['layout']),
    );
  }
}
