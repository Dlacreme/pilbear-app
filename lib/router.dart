
import 'package:flutter/material.dart';
import 'package:pilbear_app/screens/loading.screen.dart';
import 'package:pilbear_app/screens/login.screen.dart';
import 'pages/events.page.dart';
import 'pages/search.page.dart';

const String loadingPage = '/';
const String loginPage = '/login';
const String searchPage = '/search';
const String eventsPage = '/events';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // LOADING
      case loadingPage:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      // LOGIN
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
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