// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/Model/LoginModel.dart';
import 'package:reel_folio/login/manager/login_step_manager.dart';
import 'package:reel_folio/login/widgets/login_phone_widget.dart';
import 'package:reel_folio/login_data.dart';
import 'package:reel_folio/onboarding/widget/user_pin_widget.dart';
import 'package:reel_folio/route/route_path.dart';
import 'package:reel_folio/user_preferences.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/floating_action_button_widget.dart';
import 'package:reel_folio/util/progress_stepper.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/api.dart';
import '../Api/config.dart';

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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widgetRef.read(loginStepManager.notifier).state == 1
                      ? IconButton(
                          onPressed: () {
                            if (stepValue > 1) {
                              widgetRef.read(loginStepManager.notifier).state =
                                  stepValue - 1;
                            } else {
                              widgetRef.read(loginStepManager.notifier).state =
                                  1;
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            if (stepValue > 1) {
                              widgetRef.read(loginStepManager.notifier).state =
                                  stepValue - 1;
                            } else {
                              widgetRef.read(loginStepManager.notifier).state =
                                  1;
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
                child: const Center(
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
                    var res = await Api().fetchToken(OAUTH_URL);
                    if (widgetRef.read(loginStepManager.notifier).state == 1) {
                      await Api().postMethod(
                          SEND_OTP,
                          {'email': _loginData.phoneOrEmail},
                          res['access_token']);
                    } else {
                      var resp;
                      if (_loginData.isotp) {
                        resp = await Api().postMethod(
                            LOGIN_OTP_URL,
                            {
                              'email': _loginData.phoneOrEmail,
                              'otp': _loginData.password
                            },
                            res['access_token']);
                      } else {
                        resp = await Api().postMethod(
                            LOGIN_URL,
                            {
                              'email': _loginData.phoneOrEmail,
                              'password': _loginData.password
                            },
                            res['access_token']);
                      }
                      LoginModel loginModel = LoginModel.fromJson(resp);

                      widgetRef.read(loadingManager.notifier).state = false;
                      if ((loginModel.success ?? false) &&
                          ((loginModel.data != null)) &&
                          (loginModel.data!.approved == 1)) {
                        final preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setString(
                            'access_token', loginModel.data!.token ?? '');
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(RoutePath.routeToHomeScreen);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(loginModel.message.toString()),
                          ),
                        );
                      }
                    }
                    // Navigate to some other page
                  }
                },
              ),
      ),
    );
  }
}
