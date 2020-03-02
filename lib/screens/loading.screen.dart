import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/auth.service.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/services/storage.service.dart';
import 'package:pilbear_app/widgets/spinner.widget.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  void initState() {
    super.initState();
    this.prepareApiAndFetchUser();
  }

  void prepareApiAndFetchUser() async {
    var token = await getIt<StorageService>().getToken();
    getIt.registerLazySingleton(() => PilbearApi(token));
    var user = await getIt<PilbearApi>().me();
    if (user.success == false) {
      getIt<NavigationService>().navigateTo(loginPage);
      return;
    }
    getIt<AuthService>().setCurrentUser(user.body, withRedirect: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Image(image: AssetImage('assets/pilbear-logo-full.png')),
            ),
            BigSpinnerWidget(),
          ]),
    );
  }
}
