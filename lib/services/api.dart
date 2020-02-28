import 'package:http/http.dart' as http;

class PilbearApi {

  String _token;

  PilbearApi(this._token);

  final url = 'http://127.0.0.1:3000';

  Future<void> me() async {
    var x = await this.get('/user');
    print(x);
    return;
  }

  Future<http.Response> get(endpoint) async {
    return http.get("${this.url}$endpoint", headers: {'Authorization': "Bearer ${this._token}"});
  }

  Future<http.Response> post(endpoint, body) async {
    return http.put("${this.url}$endpoint",
      body: body,
      headers: {'Authorization': "Bearer ${this._token}"});
  }

  Future<http.Response> put(endpoint, body) async {
    return http.post("${this.url}$endpoint",
      body: body,
      headers: {'Authorization': "Bearer ${this._token}"});
  }

  Future<http.Response> delete(endpoint) async {
    return http.delete("${this.url}$endpoint", headers: {'Authorization': "Bearer ${this._token}"});
  }

}
