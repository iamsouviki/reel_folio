import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens/route/route_path.dart';
import '../../util/floating_action_button_widget.dart';
import '../../util/progress_stepper.dart';
import '../../util/size_config.dart';
import '../manager/onboarding_step_manager.dart';
import 'user_bio_screen.dart';
import 'user_contact_number_screen.dart';
import 'user_cover_image_screen.dart';
import 'user_dob_widget.dart';
import 'user_name_screen.dart';
import 'otp_screen.dart';
import 'user_primary_role_screen.dart';
import 'user_primary_picture_screen.dart';
import 'user_secondary_role_screen.dart';

class OnBoardingDetailsScreen extends ConsumerWidget {
  OnBoardingDetailsScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    //name
    UserNameScreen(),
    //phone
    UserContactNumberScreen(),
    //pin
    OTPScreen(),
    //primary skill
    UserPrimaryRoleScreen(),
    //other skill
    UserSecondaryRoleScreen(),
    //profile picture
    UserProfilePictureWidget(),
    //cover picture
    UserCoverImageScreen(),
    //birthday
    const UserDOBScreen(),
    //bio
    UserBioScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final stepValue = widgetRef.watch(onBoardingStepManger);

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
                        if (stepValue > 1) {
                          widgetRef.read(onBoardingStepManger.notifier).state =
                              stepValue - 1;
                        } else {
                          widgetRef.read(onBoardingStepManger.notifier).state =
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
                      stepCount: 9,
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
        floatingActionButton: FloatingActionButtonWidget(
          onTap: () {
            if (stepValue != 9) {
              widgetRef.read(onBoardingStepManger.notifier).state =
                  stepValue + 1;
            } else {
              Navigator.pushReplacementNamed(
                  context, RoutePath.routeToWelcomeScreen);
              widgetRef.read(onBoardingStepManger.notifier).state = 1;
            }
          },
        ),
      ),
    );
  }
}
