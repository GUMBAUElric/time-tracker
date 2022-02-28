import 'package:flutter/material.dart';
import 'package:time_tracker/layouts/add_tasks.dart';

class HomeNavigationRoutes {
  late List<Map<String, dynamic>> _routes;
  late List<Widget> _routesWidgets;
  late List<IconData> _routesIcons;

  HomeNavigationRoutes(List<Map<String, dynamic>> routes) {
    _routes = routes;
    _routesWidgets = _getRoutesWidgets();
    _routesIcons = _getRoutesIcons();
  }

  List<IconData> get navigationIcons => _routesIcons;

  int get _numberOfRoutes => _routes.length;

  List<IconData> _getRoutesIcons() {
    List<IconData> icons = [];

    for (var item in _routes) {
      icons.add(item['icon']);
    }
    return icons;
  }

  List<Widget> _getRoutesWidgets() {
    List<Widget> widgets = [];

    for (var item in _routes) {
      widgets.add(item['layout']);
    }
    return widgets;
  }
}

class HomeNavigationRouter extends HomeNavigationRoutes with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  late PageView _router;

  HomeNavigationRouter({required routes}) : super(routes) {
    _router = PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: routes.length,
      itemBuilder: (context, i) => Center(child: _routesWidgets[i]),
    );
  }

  PageView buildNavigation() {
    _router = PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _numberOfRoutes,
      itemBuilder: (context, i) => Center(child: _routesWidgets[i]),
    );

    return _router;
  }

  // HomeNavigation methods
  void navigateToPage(int page) {
    if (page < 0 || page > _numberOfRoutes) page = 0;

    _router.controller.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}

HomeNavigationRouter homeNavigationRouter = HomeNavigationRouter(routes: [
  {"icon": Icons.home_rounded, "layout": const Text("Home")},
  {"icon": Icons.add_rounded, "layout": TTAddTasks()}
]);