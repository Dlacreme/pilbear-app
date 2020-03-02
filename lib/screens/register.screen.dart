import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/services/validator.service.dart';
import 'package:pilbear_app/theme.dart';
import 'package:pilbear_app/widget_factories/snack_bar.factory.dart';
import 'package:pilbear_app/widgets/spinner.widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool _loading = false;
  ValidatorService _validator = getIt<ValidatorService>();

  void _submit() async {
    setState(() {
      _loading = true;
    });
    var user = await getIt<PilbearApi>().register(
        _emailController.text.trim(), _passwordController.text.trim());
    setState(() {
      _loading = false;
    });
    if (user.success) {
      getIt<AuthService>().logUser(user.body, withRedirect: true);
    } else {
      Scaffold.of(context).showSnackBar(
          errorSnackBar(context, translate(context, 'USER.LOGIN_FAILED')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 80),
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(children: [
                    Container(
                      width: 75,
                      margin: EdgeInsets.only(right: 30),
                      child:
                          Image(image: AssetImage('assets/pilbear-logo.png')),
                    ),
                    Text(translate(context, 'USER.CREATE_ACCOUNT'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ]),
                  Container(margin: EdgeInsets.only(bottom: 30)),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: translate(context, 'USER.EMAIL')),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return translate(context, 'FORM.INVALID');
                      }
                      if (!_validator.email.hasMatch(value)) {
                        return translate(context, 'FORM.INVALID_EMAIL');
                      }
                      return null;
                    },
                  ),
                  Container(margin: EdgeInsets.only(bottom: 20)),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: translate(context, 'USER.PASSWORD')),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'invalud';
                      }
                      return null;
                    },
                  ),
                  Container(margin: EdgeInsets.only(bottom: 20, top: 20)),
                  Container(
                    child: _loading == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  getIt<NavigationService>().pop();
                                },
                                child: Text(
                                    translate(context, 'USER.BACK_LOGIN'),
                                    style: TextStyle(
                                        color: PilbearColors.accentColor)),
                              ),
                              Container(
                                width: 130,
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_loginFormKey.currentState.validate()) {
                                      _submit();
                                    }
                                  },
                                  color: PilbearColors.successColor,
                                  child: Text(translate(context, 'FORM.SUBMIT'),
                                      style: TextStyle(
                                          color: PilbearColors.whiteColor)),
                                ),
                              ),
                            ],
                          )
                        : SpinnerWidget(),
                  ),
                ],
              ),
            )));
  }
}
