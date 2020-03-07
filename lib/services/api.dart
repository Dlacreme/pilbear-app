import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pilbear_app/main.dart';
import 'dart:convert' as convert;

import 'package:pilbear_app/models/user.model.dart';

class ApiResult {
  dynamic body;
  bool success;
  int code;

  ApiResult(this.body, this.success, this.code);
}

class PilbearApi {
  String _token;

  PilbearApi(this._token);

  final url = 'https://pilbear-cr.herokuapp.com';

  Future<void> fake() async {
    await Future.delayed(Duration(seconds: 2));
    return;
  }

  /// USERS

  Future<ApiResult> me() async {
    return await this.get('/me');
  }

  Future<ApiResult> getUser(id) async {
    var res = await this.get("/user/$id");
    return res;
  }

  Future<ApiResult> searchUser(String q) async {
    var res = await this.get("/user?q=$q");
    return res;
  }

  Future<ApiResult> login(String email, String password) async {
    var res = await this.post('/login', {'email': email, 'password': password});
    return res;
  }

  Future<ApiResult> register(String email, String password) async {
    var res =
        await this.post('/register', {'email': email, 'password': password});
    return res;
  }

  Future<ApiResult> updateProfile(UserModel user) async {
    var elem = {};
    if (!isNullEmptyOrFalse(user.nickname)) {
      elem['nickname'] = user.nickname;
    }
    if (!isNullEmptyOrFalse(user.picture_url)) {
      elem['picture_url'] = user.picture_url;
    }
    if (!isNullEmptyOrFalse(user.birthdate)) {
      elem['birthdate'] = user.birthdate;
    }
    if (!isNullEmptyOrFalse(user.gender)) {
      elem['gender'] = user.gender;
    }
    // if (user.favorites != null) {
    //   elem['favorites'] = user.favorites.map((f) {
    //     return f.id;
    //   });
    // }
    return _responseToApiResult(await this.put('/profile', elem));
  }

  Future<String> upload(File file, String type) async {
    var req =
        http.MultipartRequest('POST', Uri.parse("${this.url}/upload/$type"))
          ..files.add(await http.MultipartFile.fromPath('image', file.path));
    req.headers['Authorization'] = "Bearer ${this._token}";
    var res = await req.send();
    return convert.jsonDecode(await res.stream.bytesToString())['file_url'];
  }

  /// USERS
  /// END

  /// CATEGORIES
  Future<ApiResult> categories() async {
    var res = await this.get('/categories');
    return res;
  }

  /// CATEGORIES
  /// END

  void setToken(String token) {
    _token = token;
  }

  /// QUERY BUILDERS
  Future<dynamic> get(endpoint) async {
    return _responseToApiResult(
        await http.get("${this.url}$endpoint", headers: _headers()));
  }

  Future<dynamic> post(endpoint, body) async {
    return _responseToApiResult(await http.post("${this.url}$endpoint",
        body: convert.jsonEncode(body),
        headers: _headers(),
        encoding: convert.Encoding.getByName('uft-8')));
  }

  Future<dynamic> put(endpoint, body) async {
    return _responseToApiResult(await http.put("${this.url}$endpoint",
        body: convert.jsonEncode(body),
        headers: _headers(),
        encoding: convert.Encoding.getByName('uft-8')));
  }

  Future<dynamic> delete(endpoint) async {
    return _responseToApiResult(
        await http.delete("${this.url}$endpoint", headers: _headers()));
  }

  Map<String, String> _headers() {
    return (this._token != null && this._token != ''
        ? {
            'Content-Type': 'application/json',
            'Authorization': "Bearer ${this._token}"
          }
        : {
            'Content-Type': 'application/json',
          });
  }

  ApiResult _responseToApiResult(http.Response res) {
    var body = res.body != '' ? convert.jsonDecode(res.body) : null;
    return ApiResult(body, res.statusCode < 400, res.statusCode);
  }
}
