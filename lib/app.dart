import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pilbear_app/intl.dart';
import 'package:pilbear_app/pages/search.page.dart';
import 'package:pilbear_app/router.dart';
import 'package:pilbear_app/theme.dart';
import 'package:pilbear_app/widgets/bottomBar.dart';
import 'package:sentry/sentry.dart';

class MyApp extends StatefulWidget {
  static var breadcrumbs = [Breadcrumb("app started", DateTime.now())];
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pilbear',
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
      localizationsDelegates: [
        Translate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: pilbearThemeData,
      onGenerateRoute: Router.generateRoute,
      initialRoute: searchPage,
      builder: (context, widget) {
        return Scaffold(
          extendBody: true,
          body: SearchPage(SearchModeEnum.Map),
          bottomNavigationBar: BottomBar(),
        );
      },
    );
  }
}
