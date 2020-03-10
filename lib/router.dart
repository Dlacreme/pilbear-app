import 'package:flutter/material.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/pages/profile.page.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit.page.dart';
import 'package:pilbear_app/screens/loading.screen.dart';
import 'package:pilbear_app/screens/login.screen.dart';
import 'package:pilbear_app/screens/register.screen.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/services/ui.service.dart';
import 'pages/events.page.dart';
import 'pages/search.page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    getIt<UIService>().showBottomBar.value = displayBottomBar(settings.name);
    switch (settings.name) {
      // LOADING
      case loadingPage:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      // LOGIN
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // REGISTER
      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      // SEARCH
      case searchPage:
        var mode = settings.arguments != null
            ? settings.arguments as SearchModeEnum
            : SearchModeEnum.Map;
        return MaterialPageRoute(builder: (_) => SearchPage(mode));
      // EVENTS
      case eventsPage:
        return MaterialPageRoute(builder: (_) => EventsPage());
      // NOT FOUND
      case profilePage:
        var userId = settings.arguments != null
            ? settings.arguments as int
            : getIt<AuthService>().currentUser.id;
        return MaterialPageRoute(builder: (_) => ProfilePage(userId));
      case profileEditPage:
        return MaterialPageRoute(builder: (_) => ProfileEditPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static bool displayBottomBar(String pageName) {
    return pageName != loadingPage &&
        pageName != loginPage &&
        pageName != registerPage;
  }
}
