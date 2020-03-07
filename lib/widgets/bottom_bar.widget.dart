import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/services/ui.service.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool _show = false;
  int _selectedIndex = 1;

  @override
  void initState() {
    var uiService = getIt<UIService>();
    uiService.showBottomBar.addListener(() {
      setState(() {
        _show = uiService.showBottomBar.value;
      });
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        getIt<NavigationService>().navigateTo(eventsPage);
        break;
      case 1:
        getIt<NavigationService>().navigateTo(searchPage);
        break;
      case 2:
        getIt<NavigationService>().navigateTo(profilePage);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: _show,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text(translate(context, 'BOTTOM_BAR.EVENTS')),
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text(translate(context, 'BOTTOM_BAR.SEARCH')),
                icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                title: Text(translate(context, 'BOTTOM_BAR.PROFILE')),
                icon: Icon(Icons.person)),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
