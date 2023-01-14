import 'dart:convert';

import 'package:dio/dio.dart';

class AuthService{

  Future<bool> login() async {
    Dio dio = Dio();

    try {
      String url = 'http://stagingdb.reelfolio.com:8080/auth/login';

      var response = await dio.post(url, data: {
        /*"email": _loginData.phoneOrEmail,
        "password": _loginData.password,*/
      });

      print(response.toString());

      Map<String, dynamic> data = json.decode(response.toString());

      //await _preferences.saveAccessToken(data['accessToken']);

      print(data);

      return data['isApproved'];
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}