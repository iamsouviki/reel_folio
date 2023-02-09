import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/model/user_role_model.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';
import 'package:reel_folio/authentication-flow/services/client_secret.dart';
import 'package:reel_folio/core/reel_folio_api_url.dart';
import 'package:reel_folio/user_preferences.dart';

import 'login_data.dart';

final authProvider = Provider<AuthService>(
  (ref) => AuthService(),
);

final userRoleProvider = FutureProvider.autoDispose<UserRoleModel?>(
  (ref) => ref.read(authProvider).getUserRole(),
);

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

  Future<LoginResponse?> loginWithOTP(int otp) async {
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

      return LoginResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
      }
      return null;
    }
  }

  Future<OTPResponse> onBoardingStepOne() async {
    try {
      String url = ReelFolioAPIURL.onBoardingStepOne;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      print(url);

      String number = _userDetails.userPhoneNumber!
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('-', '')
          .replaceAll(' ', '')
          .trim();

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

      _userDetails.otpCode = response.data['data']['code'].toString();
      _userDetails.id = response.data['data']['id'];

      return OTPResponse.fromJson({
        "success": true,
        "message": "",
      });
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
        return OTPResponse.fromJson(e.response!.data!);
      }
      return OTPResponse.fromJson(
          {"success": false, "message": "Please try again", "data": null});
    }
  }

  Future<OTPResponse> onBoardingStepTwo() async {
    try {
      String url = ReelFolioAPIURL.onBoardingStepTwo;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      print(url);

      Map data = {
        "id": _userDetails.id!,
        "otp": _userDetails.otpCode,
        "work_link": _userDetails.socialMediaLink,
        "name": _userDetails.username,
        "email": _userDetails.userEmail,
        "primary_role_id": _userDetails.primarySkill,
        "password": _userDetails.password,
        "password_confirmation": _userDetails.confirmPassword,
        "other_skills_id": _userDetails.otherSkills!,
      };

      print(data);

      /*String number = _userDetails.userPhoneNumber!.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll(' ', '').trim();


      print(number);*/

      Response response = await _dio.post(
        url,
        data: {
          "id": _userDetails.id!,
          "otp": _userDetails.otpCode,
          "work_link": 'https://facebook.com',
          "name": _userDetails.username,
          "email": _userDetails.userEmail,
          "primary_role_id": _userDetails.primarySkill,
          "password": _userDetails.password,
          "password_confirmation": _userDetails.confirmPassword,
          "other_skills_id": _userDetails.otherSkills,
        },
      );

      print(response.toString());

      return OTPResponse.fromJson({
        "success": true,
        "message": response.data["message"],
      });
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
        return OTPResponse.fromJson(e.response!.data!);
      }
      return OTPResponse.fromJson(
          {"success": false, "message": "Please try again", "data": null});
    }
  }

  Future<OTPResponse> onBoardingFinalStep() async {
    try {
      String url = ReelFolioAPIURL.onBoardingFinalStep;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      /*String number = _userDetails.userPhoneNumber!.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll(' ', '').trim();


      print(number);*/

      var formData = FormData.fromMap({
        'id': 1,
        'bio': _userDetails.bio,
        'profile_picture': await MultipartFile.fromFile(
            _userDetails!.coverPic!.path,
            filename: _userDetails.coverPic!.toString()),
        'cover_picture': await MultipartFile.fromFile(
            _userDetails!.coverPic!.path,
            filename: _userDetails.coverPic!.toString()),
      });
      Response response = await _dio.post(url, data: formData);

      print('Response: '+response.toString());

      return OTPResponse.fromJson({
        "success": true,
        "message": response.data["message"],
      });
    } catch (e, stackTrace) {
      if (e is DioError) {
        print(e.response);
        return OTPResponse.fromJson(e.response!.data!);
      }
      return OTPResponse.fromJson(
          {"success": false, "message": "Please try again", "data": null});
    }
  }

  Future<UserRoleModel?> getUserRole() async {
    try {
      String url = ReelFolioAPIURL.userRole;

      String clientAccessToken = await getClientSecret();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      Response response = await _dio.get(url);

      print(response.data.toString());

      return UserRoleModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? name;
  String? email;
  int? id;
  int? approved;
  int? isNew;
  String? token;

  Data({
    this.name,
    this.email,
    this.id,
    this.approved,
    this.isNew,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    approved = json['approved'];
    isNew = json['isNew'];
    token = json['token'];
  }
}
