
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import '../intl.dart';
import '../router.dart';

class BottomBar extends StatefulWidget {

  final navigatorKey;

  BottomBar(this.navigatorKey);

  @override
  State<StatefulWidget> createState() => _BottomBarState(this.navigatorKey);
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 1;
  final navigatorKey;

  _BottomBarState(this.navigatorKey);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // navigatorKey.currentState.pushNamed(context, eventsPage);
        getIt<NavigationService>().navigateTo(eventsPage);
        break;
      case 1:
        getIt<NavigationService>().navigateTo(searchPage);
        // navigatorKey.currentState.pushNamed(context, searchPage);
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text(translate(context, 'BOTTOM_BAR.EVENTS')),
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          title: Text(translate(context, 'BOTTOM_BAR.SEARCH')),
          icon: Icon(Icons.search)
        ),
        BottomNavigationBarItem(
          title: Text(translate(context, 'BOTTOM_BAR.PROFILE')),
          icon: Icon(Icons.person)
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
