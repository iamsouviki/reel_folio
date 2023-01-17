import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/services/auth_service.dart';

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

  routeToNextScreen() async{

    await AuthService().getClientSecret().then((value){
      Navigator.of(context).pushReplacementNamed(
        RoutePath.routeToAuthenticationScreen,
      );
    });

   // Timer(const Duration(seconds: 2), () {

      /*Navigator.pushReplacement(context,
    // Instantiate the new page
    // MaterialPageRoute(builder: (context) => const Homepage()),);
    MaterialPageRoute(builder: (context) => const TestPage()),);*/
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
