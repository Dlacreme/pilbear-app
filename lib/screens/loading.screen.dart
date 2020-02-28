
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/app.widget.dart';

class LoadingScreen extends ScreenWidget {
  @override
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('I am the search page');
  }
}
