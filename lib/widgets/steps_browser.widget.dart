import 'package:flutter/material.dart';
import 'package:pilbear_app/intl.dart';

class StepsBrowser extends StatefulWidget {
  List<Widget> _children;
  int _startAt;
  StepsBrowser({List<Widget> children = const <Widget>[], int startAt = 0}) {
    this._children = children;
    this._startAt = startAt;
  }

  @override
  _StepsBrowser createState() => _StepsBrowser(_children, _startAt);
}

class _StepsBrowser extends State<StepsBrowser> {
  List<Widget> _children;
  int _currentStepIndex;

  _StepsBrowser(this._children, this._currentStepIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
                width: double.infinity, child: _children[_currentStepIndex])),
        Container(
            height: 80,
            child: Row(
              children: <Widget>[
                Visibility(
                    visible: _currentStepIndex > 0,
                    child: FlatButton(
                      child: Icon(Icons.arrow_back),
                      onPressed: () => setState(() {
                        _currentStepIndex -= 1;
                      }),
                    )),
                Visibility(
                    visible: _currentStepIndex < _children.length - 1,
                    child: RaisedButton(
                      child: Text(translate(context, 'FORM.NEXT')),
                      onPressed: () => setState(() {
                        _currentStepIndex += 1;
                      }),
                    ))
              ],
            ))
      ],
    );
  }
}
