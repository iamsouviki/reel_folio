import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';
import 'package:reel_folio/authentication-flow/services/client_secret.dart';
import 'package:reel_folio/core/reel_folio_api_url.dart';
import 'package:reel_folio/user_preferences.dart';

import 'login_data.dart';

class AuthService {
  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  LoginData get _loginData => GetIt.I<LoginData>();

  OnBoardingUserDetailsModel get _userDetails =>
      GetIt.I<OnBoardingUserDetailsModel>();

  final Dio _dio = Dio();

  Future<String> getClientSecret() async {
    try {
      String url = ReelFolioAPIURL.oAuthURL;

      var response = await _dio.post(url, data: clientSecret);

      Map<String, dynamic> data = json.decode(response.toString());

      print(data.toString());

      print('Client Secret: ${data['access_token']}');

      await _preferences.saveAccessToken(data['access_token']);

      return data['access_token'];
    } catch (e) {
      if (e is DioError) {
        print(e.response.toString());
      }
      return '';
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

      print(url);

      Response response = await _dio.post(
        url,
        data: {
          "email": "subhankard@qworkz.com",
        },
      );

      print(response.toString());

      return OTPResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
      }
      print(e.toString());
      print(stackTrace.toString());
      return OTPResponse.fromJson(
        {"success": true, "message": "Can not authorize", "data": null},
      );
    }
  }

  Future<bool> loginWithPassword() async {
    try {
      String url = ReelFolioAPIURL.loginURL;

      String oAuthToken = await getClientSecret();

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

      print(data);

      //_loginData.clearData();

      return response.statusCode.toString().startsWith('2');
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> loginWithOTP(int otp) async {
    try {
      String url = ReelFolioAPIURL.loginWithOTPURL;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      print(url);

      Response response = await _dio.post(
        url,
        data: {"email": _loginData.phoneOrEmail, "otp": otp},
      );

      print(response.toString());

      _loginData.clearData();

      return response.statusCode!.toString().startsWith('2');
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
      }
      return false;
    }
  }

  Future<OTPResponse> onBoardingStepOne() async {
    try {
      String url = ReelFolioAPIURL.onBoardingStepOne;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      print(url);

      String number = _userDetails.userPhoneNumber!.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll(' ', '').trim();


      print(number);

      Response response = await _dio.post(
        url,
        data: {
          "name": _userDetails.username,
          "email": _userDetails.userEmail,
          "phone": number,
        },
      );

      print(response.toString());


      return OTPResponse.fromJson({"success":true,"message":"",});
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
        return OTPResponse.fromJson(e.response!.data!);
      }
      return OTPResponse.fromJson({"success":false,"message":"Please try again","data":null});
    }
  }
}
