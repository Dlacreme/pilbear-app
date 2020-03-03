import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/models/user.model.dart';
import 'package:pilbear_app/services/api.dart';
import 'package:pilbear_app/services/navigation.service.dart';
import 'package:pilbear_app/services/storage.service.dart';

class AuthService {
  UserModel _user;

  bool get isLogged => _user != null;
  UserModel get currentUser => _user;

  void logUser(dynamic loginPayload, {withRedirect: false}) async {
    var apiService = getIt<PilbearApi>();
    apiService.setToken(loginPayload["token"]);
    getIt<StorageService>().setToken(loginPayload["token"]);
    var res = await apiService.me();
    if (!res.success) {
      print('Unexpected flow error');
    }
    this.setCurrentUser(res.body, withRedirect: withRedirect);
  }

  void setCurrentUser(dynamic userData, {withRedirect: false}) {
    _user = UserModel(userData);
    if (withRedirect) {
      getIt<NavigationService>().navigateTo(searchPage);
    }
  }
}
