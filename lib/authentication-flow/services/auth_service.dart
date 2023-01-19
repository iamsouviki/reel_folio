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

      String clientAccessToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTlkNjQ2YmEyNDA4YzEzNmM3Yjc5MTllMDNjNGM5ODFkM2E0MjFhYzY1OTU3YTdmMWNmNGFhNDgwN2U3NDlhNWQzZTc5OGRjMTlhZTY3YTAiLCJpYXQiOjE2NzM5ODE0MDQuNDY4OTM2LCJuYmYiOjE2NzM5ODE0MDQuNDY4OTQsImV4cCI6MTY3NTI3NzQwNC40NTkzNDcsInN1YiI6IiIsInNjb3BlcyI6W119.s6Fm6E_s-3NuAABVoIzFAFKgvCTsF0AVrr_M0ccnAk5NF2MunH8XXzl58xJte0UtPiLGb9YCPDvcuJKgqwcuU-CeFCd2p8X4p1HWKxVizacPi83qIICuTZz-jzJRznNxBmttp8TJNco5gXfUpUcNMeX1owYo2pKsyqeMsFE8Or9mGNmyoC7CD7O-Zdchbu1PGGxsC0AlQHBujG5uaIe0ZdDrQRR8DxOT1Du1EoYPoWIL3rkqKZi930nO2zYX5lro-JcCwloopVE_AfrzTc8FSG4oIrEb_-OVXk1c9j5egS0NooxSom6JSMCNpoM_4vbmdY6ulIZikB6sNESbfFR5I9F3pCsZPqrQH-PC8j4eU-VSXoHAFTmhzFzn_RPutq-HpzhzTxhesgUpCk8whys0VdqY5DPDOd1dUBD3MHihWX2zmQTiHwGGoYRoSvh4CeQZQGxjVcoqRl8vNTZuwYBhPsJm9rDsujDJ38YM6F2nR1yPmisEC91AYWo1FzlCIcsYRKNtooVRLi8nhqT81uPOzRyBP71N3dEn97ro4CjK_Eo2BbRhvhw4vbUquc92PUQNUjVZkIq_Nk15z8Pn2X0tjsnjJ-fJGJugHWyvuTvvw-g43f7MEbBEZBUyGjYySTXkgFSgpZY74KJ2sWcCK_bbeqaUxIAYSdw-07kDzx_v6s8';


      print(clientAccessToken);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $clientAccessToken';

      print(url);

      Response response = await _dio.post(
        url,
        data: {
          "email" : "subhankard@qworkz.com",
        },
      );

      print(response.toString());

      return OTPResponse.fromJson(response.data);
    } catch (e,stackTrace) {
      if(e is DioError){
        print(e.response);
      }
      print(e.toString());
      print(stackTrace.toString());
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
