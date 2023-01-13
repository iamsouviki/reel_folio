import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/screens/login/manager/login_step_manager.dart';
import 'package:reel_folio/screens/login/widgets/login_phone_widget.dart';
import 'package:reel_folio/logic/core/login_data.dart';
import 'package:reel_folio/screens/onboarding/widget/user_pin_widget.dart';
import 'package:reel_folio/user_preferences.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/floating_action_button_widget.dart';
import 'package:reel_folio/util/progress_stepper.dart';
import 'package:reel_folio/util/size_config.dart';

import '../route/route_path.dart';

final loadingManager = StateProvider<bool>((ref) => false);

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final List<Widget> _screens = [
    // login page
    LoginPhoneWidget(),
    // pin page
    UserPinWidget(),
  ];

  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  LoginData get _loginData => GetIt.I<LoginData>();

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final stepValue = widgetRef.watch(loginStepManager);

    var isLoading = widgetRef.watch(loadingManager);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 12 / 375,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (stepValue > 1) {
                          widgetRef.read(loginStepManager.notifier).state =
                              stepValue - 1;
                        } else {
                          widgetRef.read(loginStepManager.notifier).state = 1;
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    ProgressStepper(
                      width: 200,
                      stepCount: 2,
                      padding: 5,
                      currentStep: stepValue,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        fontSize: screenWidth! * 14 / 375,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 35 / 375,
                  ),
                  child: _screens[stepValue - 1],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: isLoading
            ? Container(
                height: screenWidth! * 50 / 375,
                width: screenWidth! * 58 / 375,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
            : FloatingActionButtonWidget(
                onTap: () async {
                  if (stepValue != 2) {
                    widgetRef.read(loginStepManager.notifier).state =
                        stepValue + 1;
                  } else {
                    widgetRef.read(loadingManager.notifier).state = true;

                    bool resp = await login();

                    print(resp.toString());

                    widgetRef.read(loadingManager.notifier).state = false;

                    if (resp) {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RoutePath.routeToHomeScreen, (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please check your credentials'),
                      ));
                    }
                    // Navigate to some other page
                  }
                },
              ),
      ),
    );
  }

  Future<bool> login() async {
    Dio dio = Dio();

    try {
      String url = 'http://stagingdb.reelfolio.com:8080/auth/login';

      var response = await dio.post(url, data: {
        "email": _loginData.phoneOrEmail,
        "password": _loginData.password,
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
