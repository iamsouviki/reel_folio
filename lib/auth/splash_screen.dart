import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/route_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    routeToNextScreen();
    super.initState();
  }

  routeToNextScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(RoutePath.routeToRequestOnBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CupertinoActivityIndicator(
        color: Colors.white,
      ),),
    );
  }
}
