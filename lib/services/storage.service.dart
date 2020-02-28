
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  final _tokenKey = 'pilbear_auth_token';

  Future<bool> save() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<String> getToken() async {
    return (await getSharedPreferences()).getString(this._tokenKey);
  }

  void setToken(String token) async {
    (await getSharedPreferences()).setString(this._tokenKey, token);
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }

}
