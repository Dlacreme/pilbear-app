import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get_it/get_it.dart';
import 'package:pilbear_app/app.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/services/validator.service.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/storage.service.dart';
import 'package:pilbear_app/services/ui.service.dart';

GetIt getIt = GetIt.instance;

void main() {
  // Notes: we also register PilbearApi() in `loading.screen.dart`
  getIt.registerLazySingleton(() => ValidatorService());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => StorageService());
  getIt.registerLazySingleton(() => UIService());
  runApp(MyApp());
}

bool isKeyboardOpen(BuildContext context) =>
    !(MediaQuery.of(context).viewInsets.bottom == 0.0);

bool get isIos =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

bool get isAndroid =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.android;

bool isNullEmptyOrFalse(Object o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object o) =>
    o == null || false == o || 0 == o || "" == o;
