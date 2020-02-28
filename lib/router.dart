
import 'package:flutter/material.dart';
import 'pages/events.page.dart';
import 'pages/search.page.dart';

const String searchPage = '/';
const String eventsPage = '/events';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // SEARCH
      case searchPage:
        var mode = settings.arguments != null ? settings.arguments as SearchModeEnum : SearchModeEnum.Map;
        return MaterialPageRoute(builder: (_) => SearchPage(mode));
      // EVENTS
      case eventsPage:
        return MaterialPageRoute(builder: (_) => EventsPage());
      // NOT FOUND
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ));
    }
  }
}