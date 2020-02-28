
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/router.dart';
import 'package:pilbear_app/services/navigation.service.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('GO TO SEARCH PAGE'),
      onPressed: () => getIt<NavigationService>().navigateTo(searchPage),
    );
  }
}
