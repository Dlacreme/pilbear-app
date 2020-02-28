import 'package:flutter/material.dart';

class PilbearColors {
  static final primaryColor = Color(0xff255957);
  static final accentColor = Color(0xff05151f);
  static final whiteColor = Color(0xffffffff);
  static final errorColor = Color(0xffd76666);
  static final successColor = Color(0xff4eb3af);
  static final bottomBarIconActive = Color(0xffe0e0e0);
  static final borderColor = Color(0xffe0e0e0);
  static final topBorder = BoxDecoration(
      color: Colors.white,
      border:
          Border(top: BorderSide(width: 0.8, color: PilbearColors.borderColor)));
  static final bottomBorder = BoxDecoration(
      color: Colors.white,
      border: Border(
          bottom: BorderSide(width: 0.8, color: PilbearColors.borderColor)));
  static final boxShadow = new BoxDecoration(
    color: Colors.white,
    border: Border(bottom: BorderSide(width: 0.8, color: Color(0xffe0e0e0))),
    boxShadow: [
      BoxShadow(
        color: Color(0x11ffffff),
        blurRadius: 0.5, // soften the shadow
        spreadRadius: 2.0, //extend the shadow
        offset: Offset(
          0.0, // Move to right 10  horizontally
          0.0, // Move to bottom 10 Vertically
        ),
      )
    ],
  );
}

ThemeData get pilbearThemeData {
  return ThemeData(
    snackBarTheme: SnackBarThemeData(elevation: 6),
    tabBarTheme: TabBarTheme(labelColor: Colors.black),
    fontFamily: 'DMSans',
    appBarTheme: AppBarTheme(
      elevation: 0,
      brightness: Brightness.light,
      color: Colors.white,
      iconTheme: IconThemeData(color: Color(0xff3a3a3a)),
      textTheme: TextTheme(
      title: TextStyle(
        color: Color(0xff3a3a3a),
        fontSize: 20,
        fontWeight: FontWeight.w500),
      )
    ),
    buttonTheme: ButtonThemeData(splashColor: Colors.transparent),
    primaryColorLight: PilbearColors.primaryColor,
    textTheme: TextTheme(
      title: TextStyle(color: PilbearColors.primaryColor),
      subtitle: TextStyle(
      color: Color(0xff410ce3),
      fontSize: 16,
      fontWeight: FontWeight.bold),
    ),
    primaryColor: PilbearColors.primaryColor,
    dividerColor: Colors.grey[300],
    backgroundColor: Colors.white
  );
}