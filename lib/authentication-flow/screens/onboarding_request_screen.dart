import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/screens/user_pin_widget.dart';
import 'package:reel_folio/authentication-flow/screens/user_primary_role_screen.dart';
import 'package:reel_folio/authentication-flow/services/auth_service.dart';
import 'package:reel_folio/util/floating_action_button_widget.dart';
import 'package:reel_folio/util/size_config.dart';
import '../../screens/route/route_path.dart';
import '../../util/progress_stepper.dart';
import '../manager/onboarding_step_manager.dart';
import 'user_details_screen.dart';
import 'user_secondary_role_screen.dart';
import 'user_social_media_information_screen.dart';

StateProvider loadingNotifier = StateProvider<bool>((ref) => false);

class OnBoardingRequestScreen extends ConsumerWidget {
  OnBoardingRequestScreen({
    Key? key,
  }) : super(key: key);

  final List<Widget> _screens = [
    UserDetailsScreen(),
    UserPinWidget(),
    UserPasswordWidget(),
    UserSocialMediaInformationScreen(),
    UserPrimaryRoleScreen(),
    UserSecondaryRoleScreen(),
  ];

  OnBoardingUserDetailsModel get _userDetails =>
      GetIt.I<OnBoardingUserDetailsModel>();

  AuthService get _authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final stepValue = widgetRef.watch(onBoardingStepManger);

    var loading = widgetRef.watch(loadingNotifier);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
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
                        if (stepValue != 1) {
                          widgetRef.read(onBoardingStepManger.notifier).state =
                              stepValue - 1;
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    ProgressStepper(
                      width: 100,
                      stepCount: 6,
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
        floatingActionButton: loading
            ? const CupertinoActivityIndicator()
            : FloatingActionButtonWidget(
                onTap: () async {
                  print(stepValue.toString());
                  if (stepValue == 1) {
                    if (_userDetails.isValid()) {
                      widgetRef.read(loadingNotifier.notifier).state = true;
                      OTPResponse resp = await _authService.onBoardingStepOne();
                      widgetRef.read(loadingNotifier.notifier).state = false;
                      if (resp!.success!) {
                        widgetRef.read(onBoardingStepManger.notifier).state =
                            stepValue + 1;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(resp!.message!),
                          ),
                        );
                      }
                    }
                  } else if (stepValue == 2) {
                    if (_userDetails.otpAdded!.trim() ==
                        _userDetails.otpCode!.trim()) {
                      widgetRef.read(onBoardingStepManger.notifier).state++;
                    }
                  } else if (stepValue == 3) {
                    if (_userDetails.password!.trim() ==
                        _userDetails.confirmPassword!.trim()) {
                      widgetRef.read(onBoardingStepManger.notifier).state++;
                    }
                  } else if (stepValue > 3 && stepValue < 6) {
                    widgetRef.read(onBoardingStepManger.notifier).state++;
                  } else if (stepValue == 6) {
                    print(_userDetails.primarySkill);
                    print(_userDetails.otherSkills!);
                    var resp = await _authService.onBoardingStepTwo();
                    if (resp.success!) {
                      Navigator.pushReplacementNamed(context,
                          RoutePath.routeToOnBoardingConfirmationScreen);
                      widgetRef.read(onBoardingStepManger.notifier).state = 1;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(resp.message!),
                      ));
                    }
                  }
                },
              ),
      ),
    );
  }
}
