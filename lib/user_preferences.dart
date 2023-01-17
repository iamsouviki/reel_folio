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

  Future saveClientToken(String token) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(
      'client_token',
      token,
    );
  }

  Future<String?> getClientToken() async {
    final preferences = await SharedPreferences.getInstance();

    final accessToken = preferences.getString(
      'client_token',
    );

    return accessToken;
  }
}
