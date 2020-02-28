
import 'package:flutter/material.dart';

abstract class AppWidget extends StatefulWidget {
  AppWidget({key: Key}) : super(key: key);

  bool get showBottomBar;
}


abstract class PageWidget extends AppWidget {
  PageWidget({key: Key}) : super(key: key);

  bool get showBottomBar => true;
}


abstract class ScreenWidget extends AppWidget {
  ScreenWidget({key: Key}) : super(key: key);

  bool get showBottomBar => false;
}
