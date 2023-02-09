import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/screens/user_bio_screen.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';
import 'package:reel_folio/authentication-flow/services/auth_service.dart';
import 'package:reel_folio/screens/route/route_path.dart';

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
  OnBoardingPortfolioScreenState createState() => OnBoardingPortfolioScreenState();
}

class OnBoardingPortfolioScreenState extends ConsumerState {

  final List<Widget> _screens = [
    UserBioScreen(),
    UserProfilePictureWidget(),
    UserCoverImageScreen(),
  ];

  OnBoardingUserDetailsModel get userDetails => GetIt.I<OnBoardingUserDetailsModel>();

  AuthService get _authService => GetIt.I<AuthService>();

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
          //onTap: (){},
          onTap: () async {


            if(stepValue == 1 && userDetails.bio!.isNotEmpty){
              ref.read(onBoardingStepManger.notifier).state =
                  stepValue + 1;
            }else if(stepValue == 2 && userDetails.profileImage!.path.isNotEmpty){
              ref.read(onBoardingStepManger.notifier).state =
                  stepValue + 1;
            }else if(stepValue == 3 && userDetails.coverPic!.path.isNotEmpty){
              OTPResponse response = await _authService.onBoardingFinalStep();
              if(response.success!){
                Navigator.popUntil(context,  ModalRoute.withName('/'));
                Navigator.pushNamed(context, RoutePath.routeToHomeScreen);
              }
            }
          },
        ),
      ),
    );
  }
}
