import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get_it/get_it.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import './app.dart';
import './models/event.model.dart';
import './models/user.model.dart';
import './services/api.dart';
import './services/auth.service.dart';
import './services/storage.service.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerFactory(() => UserModel());
  getIt.registerFactory(() => EventModel());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => PilbearApi());
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => StorageService());
  runApp(MyApp());
}

bool hasKeyboardOpen(BuildContext context) =>
  !(MediaQuery.of(context).viewInsets.bottom == 0.0);

bool get isIos =>
  foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

bool get isAndroid =>
  foundation.defaultTargetPlatform == foundation.TargetPlatform.android;
