import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/authentication-flow/screens/user_bio_screen.dart';

import '../../util/floating_action_button_widget.dart';
import '../../util/progress_stepper.dart';
import '../../util/size_config.dart';
import '../manager/onboarding_step_manager.dart';
import 'onboarding_request_screen.dart';
import 'user_cover_image_screen.dart';
import 'user_primary_picture_screen.dart';

class OnBoardingPortfolioScreen extends ConsumerStatefulWidget {
  const OnBoardingPortfolioScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingPortfolioScreenState createState() => _OnBoardingPortfolioScreenState();
}

class _OnBoardingPortfolioScreenState extends ConsumerState {


  final List<Widget> _screens = [
    UserBioScreen(),
    UserProfilePictureWidget(),
    UserCoverImageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final stepValue = ref.watch(onBoardingStepManger);

    var loading = ref.watch(loadingNotifier);

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
                          ref.read(onBoardingStepManger.notifier).state =
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
                      stepCount: 3,
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
          onTap: (){},
          /*onTap: () async {
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
          },*/
        ),
      ),
    );
  }
}
