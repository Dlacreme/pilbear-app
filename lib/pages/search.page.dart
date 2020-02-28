
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/app.widget.dart';

enum SearchModeEnum {
  Map,
  List,
}

class SearchPage extends PageWidget {
  final SearchModeEnum mode;

  SearchPage(this.mode);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Text('I am the search page');
  }
}
