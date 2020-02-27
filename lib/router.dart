
import 'package:flutter/material.dart';
import 'package:pilbear_app/pages/events.page.dart';
import 'package:pilbear_app/pages/search.page.dart';

const String searchPage = '/search';
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
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
    }
  }
}