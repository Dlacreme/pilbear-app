import 'package:flutter/material.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/theme.dart';

class PageTopBar extends StatefulWidget {
  final _title;

  PageTopBar(this._title);

  @override
  State<StatefulWidget> createState() => _PageTopBarState(_title);
}

class _PageTopBarState extends State<PageTopBar> {
  final _title;

  _PageTopBarState(this._title);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: PilbearColors.whiteColor,
            height: 60,
            padding: EdgeInsets.only(top: 5),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                    width: 60,
                    child: FlatButton(
                      child: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        getIt<NavigationService>().pop();
                      },
                    )),
                Text(_title)
              ],
            )));
  }
}
