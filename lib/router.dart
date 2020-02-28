
import 'package:flutter/material.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/pages/profile.page.dart';
import 'package:pilbear_app/screens/loading.screen.dart';
import 'package:pilbear_app/screens/login.screen.dart';
import 'package:pilbear_app/services/ui.service.dart';
import 'pages/events.page.dart';
import 'pages/search.page.dart';

const String loadingPage = '/';
const String loginPage = '/login';
const String searchPage = '/search';
const String profilePage = '/profile';
const String eventsPage = '/events';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // LOADING
      case loadingPage:
        getIt<UIService>().showBottomBar.value = false;
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      // LOGIN
      case loginPage:
        getIt<UIService>().showBottomBar.value = false;
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // SEARCH
      case searchPage:
        getIt<UIService>().showBottomBar.value = true;
        var mode = settings.arguments != null ? settings.arguments as SearchModeEnum : SearchModeEnum.Map;
        return MaterialPageRoute(builder: (_) => SearchPage(mode));
      // EVENTS
      case eventsPage:
        getIt<UIService>().showBottomBar.value = true;
        return MaterialPageRoute(builder: (_) => EventsPage());
      // NOT FOUND
      case profilePage:
        getIt<UIService>().showBottomBar.value = true;
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ));
    }
  }
}