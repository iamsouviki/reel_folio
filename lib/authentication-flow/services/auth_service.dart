import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/services/client_secret.dart';
import 'package:reel_folio/core/reel_folio_api_url.dart';
import 'package:reel_folio/user_preferences.dart';

import 'login_data.dart';

class AuthService {
  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  LoginData get _loginData => GetIt.I<LoginData>();

  final Dio _dio = Dio();

  Future<String> getClientSecret() async {
    try {
      String url = ReelFolioAPIURL.loginURL;

      var response = await _dio.post(url, data: clientSecret);

      Map<String, dynamic> data = json.decode(response.toString());

      print('Client Secret: ${data['access_token']}');

      await _preferences.saveAccessToken(data['access_token']);

      return data['access_token'];
    } catch (e) {
      return '';
    }
  }

  Future<bool> login() async {
    try {
      String url = ReelFolioAPIURL.loginURL;

      var oAuthToken = await _preferences.getClientToken();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $oAuthToken';

      var response = await _dio.post(
        url,
        data: {
          "email": _loginData.phoneOrEmail,
          "password": _loginData.password,
        },
      );

      Map<String, dynamic> data = json.decode(response.toString());

      await _preferences.saveAccessToken(data['accessToken']);

      return data['isApproved'];
    } catch (e) {
      return false;
    }
  }

  Future<OTPResponse?> sendOTP() async {
    try {
      String url = ReelFolioAPIURL.otpURL;

      print(url);

      String clientAccessToken = await getClientSecret();


      print(clientAccessToken);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      Response response = await _dio.post(
        url,
        data: {
          "email": _loginData.phoneOrEmail,
        },
      );

      return OTPResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return OTPResponse.fromJson(
        {
          "success": true,
          "message": "Can not authorize",
          "data": null
        },
      );
    }
  }
}
