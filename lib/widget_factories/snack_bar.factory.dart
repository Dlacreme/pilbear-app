import 'package:flutter/material.dart';
import 'package:pilbear_app/theme.dart';

SnackBar infoSnackBar(BuildContext context, String text) {
  return SnackBar(
      content: Text(
    text,
    textAlign: TextAlign.center,
  ));
}

SnackBar successSnackBar(BuildContext context, String text) {
  return SnackBar(
      content: Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: PilbearColors.successColor),
  ));
}

SnackBar errorSnackBar(BuildContext context, String text) {
  return SnackBar(
      content: Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: PilbearColors.errorColor),
  ));
}
