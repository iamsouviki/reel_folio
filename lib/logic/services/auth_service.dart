import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../user_preferences.dart';
import '../core/login_data.dart';

class AuthService{

  final Dio _dio = Dio();

  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  LoginData get _loginData => GetIt.I<LoginData>();

  Future<bool> login() async {

    try {
      String url = 'http://stagingdb.reelfolio.com:8080/auth/login';

      var response = await _dio.post(url, data: {
        "email": _loginData.phoneOrEmail,
        "password": _loginData.password,
      });

      if (kDebugMode) {
        print(response.toString());
      }

      Map<String, dynamic> data = json.decode(response.toString());

      return data['isApproved'];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }
}