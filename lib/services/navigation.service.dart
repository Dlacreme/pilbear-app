import 'package:flutter/material.dart';

const String loadingPage = '/';
const String loginPage = '/login';
const String searchPage = '/search';
const String profilePage = '/profile';
const String profileEditPage = '/editProfile';
const String eventsPage = '/events';
const String registerPage = '/register';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool pop() {
    return _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }
}
