import 'package:flutter/material.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/theme.dart';
import 'package:pilbear_app/widgets/page_top_bar.dart';
import 'package:pilbear_app/widgets/spinner.widget.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPage createState() => _ProfileEditPage();
}

class _ProfileEditPage extends State<ProfileEditPage> {
  int _currentStep = 1;
  bool _loading = false;

  final _profileEditForm = GlobalKey<FormState>();
  TextEditingController _nicknameController = new TextEditingController();

  void save() async {
    setState(() {
      _loading = true;
    });
    await getIt<PilbearApi>().fake();
    getIt<NavigationService>().navigateTo(profilePage);
  }

  @override
  Widget build(BuildContext context) {
    var step = Container(child: Text('Loading'));
    switch (_currentStep) {
      case 1:
        step = stepOne(context);
        break;
      case 2:
        step = stepTwo(context);
        break;
      case 3:
        step = stepThree(context);
        break;
      case 4:
        step = stepFour(context);
        break;
      case 5:
        step = stepFive(context);
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: PilbearColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: PilbearColors.borderColor,
                    offset: Offset.zero,
                    blurRadius: 2.0)
              ]),
          // boxShadow: BoxShadow(color: PilbearColors.accentColor)),
          child: Form(child: Container(child: step)),
        )),
        Container(
            height: 80,
            margin: EdgeInsets.only(bottom: 5, left: 20, right: 20),
            child: _loading
                ? Container(
                    child: SpinnerWidget(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _currentStep > 1
                          ? FlatButton(
                              child: Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  _currentStep -= 1;
                                });
                              },
                            )
                          : Container(),
                      _currentStep < 5
                          ? RaisedButton(
                              color: PilbearColors.successColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: <Widget>[
                                Text(
                                  translate(context, 'FORM.NEXT'),
                                  style: TextStyle(
                                      color: PilbearColors.whiteColor,
                                      fontSize: 16),
                                ),
                                Icon(Icons.arrow_right,
                                    color: PilbearColors.whiteColor),
                              ]),
                              onPressed: () {
                                setState(() {
                                  _currentStep += 1;
                                });
                              },
                            )
                          : _currentStep == 5
                              ? RaisedButton(
                                  color: PilbearColors.successColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(children: <Widget>[
                                    Text(
                                      translate(context, 'FORM.SAVE'),
                                      style: TextStyle(
                                          color: PilbearColors.whiteColor,
                                          fontSize: 16),
                                    ),
                                    Icon(Icons.arrow_right,
                                        color: PilbearColors.whiteColor),
                                  ]),
                                  onPressed: () {
                                    save();
                                  },
                                )
                              : Container()
                    ],
                  ))
      ],
    );
  }

  Widget stepOne(BuildContext context) {
    return Container(
        child: Column(children: [
      _stepTitle(context, 'USER.STEPS.NAME'),
      Expanded(
        child: Container(
          child: TextFormField(
            controller: _nicknameController,
            decoration:
                InputDecoration(hintText: translate(context, 'USER.NAME')),
          ),
        ),
      )
    ]));
  }

  Widget stepTwo(BuildContext context) {
    return Container(child: _stepTitle(context, 'USER.STEPS.PICTURE'));
  }

  Widget stepThree(BuildContext context) {
    return Container(child: _stepTitle(context, 'USER.STEPS.FAVORITES'));
  }

  Widget stepFour(BuildContext context) {
    return Container(child: _stepTitle(context, 'USER.STEPS.BIRTHDATE'));
  }

  Widget stepFive(BuildContext context) {
    return Container(child: _stepTitle(context, 'USER.STEPS.GENDER'));
  }

  Widget _stepTitle(BuildContext context, translateKey) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          translate(context, translateKey),
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: PilbearColors.accentColor),
        ));
  }
}
