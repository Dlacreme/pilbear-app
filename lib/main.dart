import 'package:flutter/material.dart';
import 'package:pilbear_app/app.dart';

void main() {
  runApp(MyApp());
}

bool hasKeyboardOpen(BuildContext context) =>
  !(MediaQuery.of(context).viewInsets.bottom == 0.0);
