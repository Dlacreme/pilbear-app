import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'intl.dart';
import 'router.dart';
import 'theme.dart';
import 'widgets/bottom_bar.dart';
import 'package:sentry/sentry.dart';

class MyApp extends StatefulWidget {
  static var breadcrumbs = [Breadcrumb("app started", DateTime.now())];
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final navigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: getIt<NavigationService>().navigationKey,
      // navigatorKey: this.navigatorKey,
      onGenerateRoute: Router.generateRoute,
      initialRoute: searchPage,
      builder: (context, widget) {
        return Scaffold(
          extendBody: true,
          body: Container(
            child: widget,
            padding: EdgeInsets.only(top: isAndroid ? 30 : 10),
          ),
          bottomNavigationBar: BottomBar(this.navigatorKey),
        );
      },
    );
  }
}
