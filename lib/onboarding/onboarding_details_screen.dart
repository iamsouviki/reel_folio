import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/onboarding/widget/user_profile_picture_widget.dart';

import '../util/floating_action_button_widget.dart';
import '../util/progress_stepper.dart';
import '../util/size_config.dart';
import 'manager/onboarding_step_manager.dart';
import 'widget/user_bio_widget.dart';
import 'widget/user_contact_number_widget.dart';
import 'widget/user_cover_image_widget.dart';
import 'widget/user_dob_widget.dart';
import 'widget/user_name_widget.dart';
import 'widget/user_primary_role_widget.dart';

class OnBoardingDetailsScreen extends ConsumerWidget {
  OnBoardingDetailsScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    //name
    const UserNameWidget(),
    //phone
    const UserContactNumberWidget(),
    //pin
    //primary skill
    const UserPrimaryRoleWidget(),
    //other skill
    //profile picture
    UserProfilePictureWidget(),
    //cover picture
    UserCoverImageWidget(),
    //birthday
    const UserDOBWidget(),
    //bio
    const UserBioWidget(),
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
                        widgetRef.read(onBoardingStepManger.notifier).state =
                            stepValue - 1;
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
                const AspectRatio(
                  aspectRatio: 375 / 150,
                  child: SizedBox(),
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
            } else {}
          },
        ),
      ),
    );
  }
}
