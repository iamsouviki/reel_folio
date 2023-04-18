import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  Future<void> loginUser(String email, String password) async {
    var response =
        await Dio().post('http://stagingdb.reelfolio.com:8080/auth/login',
            data: jsonEncode({
              "email": email,
              "password": password,
            }));

    print(response);

    String token = response.data;
    await GetStorage().write('token', token);
  }
}
