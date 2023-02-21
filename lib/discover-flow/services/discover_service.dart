import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/discover-flow/model/reelfolio_people_model.dart';
import 'package:reel_folio/user_preferences.dart';

import '../../authentication-flow/model/reel_folio_user_model.dart';
import '../../core/reel_folio_api_url.dart';


final discoverProvider = Provider((ref) => DiscoverService());

final peopleProvider = FutureProvider.autoDispose<ReelFolioPeopleModel?>(
      (ref) => ref.read(discoverProvider).getReelFolioUser(),
);

final peoplePortfolioManager = FutureProvider.family.autoDispose<ReelFolioUserModel?,String>(
      (ref,req) => ref.read(discoverProvider).getUserPortfolio(req),
);

class DiscoverService{

  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  final Dio _dio = Dio();

  Future<ReelFolioPeopleModel?> getReelFolioUser() async {
    try {
      String url = ReelFolioAPIURL.reelFolioUserList;

      String? accessToken = await _preferences.getAccessToken();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $accessToken';

      Response response = await _dio.get(url);

      print(response.toString());


      return ReelFolioPeopleModel.fromJson(response.data);
    } catch (e,stackTrace) {
      print('People Error: $e');
      print(stackTrace.toString());
      return null;
    }
  }

  Future<ReelFolioUserModel?> getUserPortfolio(String id) async {
    try {
      String url = ReelFolioAPIURL.reelFolioUserPortfolio;

      String? accessToken = await _preferences.getAccessToken();

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['authorization'] = 'Bearer $accessToken';

      Response response = await _dio.get(url+id);

      print(response.toString());


      return ReelFolioUserModel.fromJson(response.data);
    } catch (e,stackTrace) {
      print('People Error: $e');
      print(stackTrace.toString());
      return null;
    }
  }
}