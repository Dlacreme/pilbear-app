
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/router.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, eventsPage);
        break;
      case 1:
        Navigator.pushNamed(context, searchPage);
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
