import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/models/category.model.dart';
import 'package:pilbear_app/models/user.model.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/category.service.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/theme.dart';
import 'package:pilbear_app/widget_factories/step_counter.factory.dart';
import 'package:pilbear_app/widgets/spinner.widget.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPage createState() => _ProfileEditPage();
}

class _ProfileEditPage extends State<ProfileEditPage> {
  static UserModel _user = getIt<AuthService>().currentUser;
  List<CategoryModel> _categories = new List();
  int _currentStep = 1;
  bool _loading = false;

  final _profileEditForm = GlobalKey<FormState>();
  File _image;
  TextEditingController _nicknameController =
      new TextEditingController(text: _user.nickname);

  void save() async {
    setState(() {
      _loading = true;
    });
    await getIt<PilbearApi>().updateProfile(_user);
    getIt<NavigationService>().navigateTo(profilePage);
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _loading = true;
      getIt<PilbearApi>().upload(image, 'user').then((picUrl) {
        _user.picture_url = picUrl;
        setState(() {
          _loading = false;
        });
      });
    });
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
                      stepCounter(5, _currentStep),
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
                                  _updateProfile();
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
    print(_user.picture_url);
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          _stepTitle(context, 'USER.STEPS.PICTURE'),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: getImage,
                      child: DottedBorder(
                          color: PilbearColors.borderColor,
                          radius: Radius.circular(5),
                          strokeWidth: 2,
                          padding: EdgeInsets.all(2),
                          dashPattern: [6],
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                image: DecorationImage(
                                    image: isNullEmptyOrFalse(_user.picture_url)
                                        ? NetworkImage(
                                            'https://raw.githubusercontent.com/Dlacreme/pilbear-assets/master/user.png?token=ABUWQHLB7KFZDOUQ5IG3L3K6MOUNI')
                                        : NetworkImage(_user.picture_url))),
                            child: Container(),
                          )))))
        ]));
  }

  Widget stepThree(BuildContext context) {
    if (_categories.length == 0) {
      _loadCategories();
    }
    if (_categories.length == 0) {
      return Container(child: SpinnerWidget());
    }

    return ListView(children: _buildCategoryList());

    return Container(
        child: Column(children: <Widget>[
      _stepTitle(context, 'USER.STEPS.FAVORITES'),
      Container(
          alignment: Alignment.center,
          child: _categories.length == 0
              ? SpinnerWidget()
              : Column(
                  children: _buildCategoryList(),
                ))
      // children: _buildCategoryList(),
      // ))
    ]));
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

  void _loadCategories() async {
    var cats = await getIt<CategoryService>().list();
    setState(() {
      _categories = cats;
    });
  }

  Iterable<Widget> _buildCategoryList() {
    List<Widget> items = List();
    _categories.forEach((c) {
      items.add(ListTile(title: Text(c.label)));
    });
    print(items);
    return items;
  }

  void _updateProfile() {
    _user.nickname = _nicknameController.value.text;
  }
}
