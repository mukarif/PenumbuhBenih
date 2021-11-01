import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<void> saveUserData(String data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('user_data', data);
  }

  Future<String> readUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String data = pref.getString('user_data');
    print("Nama User :: $data");
    return data;
  }

  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('access_token', token);
  }

  Future<dynamic> readToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String data = pref.getString('access_token');
    return data;
  }

  Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('access_token');
  }

  Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = pref.getString('access_token');
    if (data != null) {
      // final accessToken = json.decode(data);
      return data;
    }
    return null;
  }
}
