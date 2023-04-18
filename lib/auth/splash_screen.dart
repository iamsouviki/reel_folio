import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/Home/homepage.dart';
import 'package:reel_folio/testpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/route_path.dart';
import '../user_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserPreferences get _preferences => GetIt.I<UserPreferences>();
  @override
  void initState() {
    routeToNextScreen();
    super.initState();
  }

  routeToNextScreen() async{
    final preferences =
    await SharedPreferences.getInstance();
    var token = await preferences.get('access_token');
    if (token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(context,
            RoutePath.routeToHomeScreen, (route) => false);});
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(
          RoutePath.routeToRequestOnBoardingScreen,
        );});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
