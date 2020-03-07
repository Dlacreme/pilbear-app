import 'package:flutter/material.dart';
import 'package:pilbear_app/theme.dart';

Widget stepCounter(int maxStep, int currentStepIndex) {
  List<Widget> dots = [];
  for (var i = 1; i <= maxStep; i++) {
    if (i < currentStepIndex) {
      dots.add(Container(
        child: Text(' '),
        decoration: BoxDecoration(
            color: PilbearColors.successColor,
            borderRadius: BorderRadius.circular(50)),
        width: 15,
        height: 15,
        margin: EdgeInsets.only(left: 2, right: 2),
      ));
    } else if (i == currentStepIndex) {
      dots.add(Container(
        child: Text(' '),
        decoration: BoxDecoration(
            color: PilbearColors.whiteColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: PilbearColors.successColor,
                  offset: Offset.zero,
                  blurRadius: 1.5,
                  spreadRadius: 0.5)
            ]),
        width: 15,
        height: 15,
        margin: EdgeInsets.only(left: 2, right: 2),
      ));
    } else if (i > currentStepIndex) {
      dots.add(Container(
        child: Text(' '),
        decoration: BoxDecoration(
            color: PilbearColors.whiteColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: PilbearColors.successColor,
                  offset: Offset.zero,
                  blurRadius: 0,
                  spreadRadius: 0)
            ]),
        width: 15,
        height: 15,
        margin: EdgeInsets.only(left: 2, right: 2),
      ));
    }
  }
  return Row(
    children: dots,
  );
}
