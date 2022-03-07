import 'package:flutter/material.dart';
import 'package:time_tracker/layouts/dashboard.dart';
import 'package:time_tracker/layouts/handle_task.dart';

class Routes {
  late List<Map<String, dynamic>> _routes;
  late List<Widget> _routesWidgets;
  late List<IconData> _routesIcons;

  Routes(List<Map<String, dynamic>> routes) {
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

class Router extends Routes with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  late PageView _router;
  int _currentRoute = 0;

  Router({required routes}) : super(routes);

  PageView buildNavigation() {
    _router = PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _numberOfRoutes,
      itemBuilder: (context, i) => Center(child: _routesWidgets[i]),
    );

    return _router;
  }

  // Getters
  int get currentRoute => _currentRoute;

  // HomeNavigation methods
  void navigateToPage(int page) {
    if (page < 0 || page > _numberOfRoutes) page = 0;

    _currentRoute = page;
    notifyListeners();

    _router.controller.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void setCurrentRouteToDefault() {
    _currentRoute = 0;
  }
}

Router router = Router(routes: [
  {"icon": Icons.home_rounded, "layout": const TTDashboard()},
  {
    "icon": Icons.add_rounded,
    "layout": const TTHandleTasks(handleTasksType: HandleTasksType.addTask)
  }
]);
