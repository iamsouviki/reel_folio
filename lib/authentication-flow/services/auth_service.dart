import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/core/reel_folio_api_url.dart';
import 'package:reel_folio/user_preferences.dart';

import 'login_data.dart';

class AuthService{

  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  LoginData get _loginData => GetIt.I<LoginData>();

  Future<bool> login() async {
    Dio dio = Dio();

    try {
      String url = ReelFolioAPIURL.loginURL;

      var response = await dio.post(url, data: {
        "email": _loginData.phoneOrEmail,
        "password": _loginData.password,
      });

      Map<String, dynamic> data = json.decode(response.toString());

      await _preferences.saveAccessToken(data['accessToken']);

      return data['isApproved'];
    } catch (e) {
      return false;
    }
  }
}