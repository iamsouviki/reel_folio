import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future saveAccessToken(String token) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('access_token', token);
  }

  Future<String?> getAccessToken() async {
    final preferences = await SharedPreferences.getInstance();

    final accessToken = preferences.getString('access_token');

    return accessToken;
  }
}