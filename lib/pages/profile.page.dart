import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/models/user.model.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/theme.dart';
import 'package:pilbear_app/widget_factories/profile_image.factory.dart';
import 'package:pilbear_app/widget_factories/snack_bar.factory.dart';
import 'package:pilbear_app/widgets/spinner.widget.dart';

class ProfilePage extends StatefulWidget {
  final int _userId;

  ProfilePage(this._userId);

  @override
  _ProfilePage createState() => _ProfilePage(_userId);
}

class _ProfilePage extends State<ProfilePage> {
  final int _userId;
  UserModel _user;
  AuthService _authService = getIt<AuthService>();

  _ProfilePage(this._userId);

  void _loadUser() async {
    if (_authService.currentUser != null &&
        _authService.currentUser.id == _userId) {
      setState(() {
        _user = _authService.currentUser;
      });
      return;
    }
    var res = await getIt<PilbearApi>().getUser(_userId);
    if (!res.success) {
      Scaffold.of(context).showSnackBar(
          errorSnackBar(context, translate(context, 'ERRORS.GLOBAL')));
      return;
    }
    setState(() {
      _user = UserModel(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      _loadUser();
    }
    return Center(
        child: _user == null
            ? SpinnerWidget()
            : Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 30),
                            child: profilePicture(_user.picture_url),
                          ),
                          Text(
                            _user.name,
                            style: TextStyle(
                                color: PilbearColors.accentColor, fontSize: 24),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 50, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            color: PilbearColors.accentColor)),
                                    child: Icon(
                                      Icons.edit,
                                      color: PilbearColors.accentColor,
                                    ),
                                    onPressed: () {
                                      getIt<NavigationService>()
                                          .navigateTo(profileEditPage);
                                    },
                                  )
                                ],
                              ))
                        ],
                      ),
                    ])));
  }
}
