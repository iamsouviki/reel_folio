import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/onboarding-request/manager/onboarding_step_manager.dart';
import 'package:reel_folio/util/size_config.dart';

import '../util/progress_stepper.dart';
import 'widget/user_details_widget.dart';
import 'widget/user_social_media_information_widget.dart';

class OnBoardingRequestScreen extends ConsumerWidget {
  const OnBoardingRequestScreen({
    Key? key,
  }) : super(key: key);

  final List<Widget> _screens = const [
    UserDetailsWidget(),
    UserSocialMediaInformationWidget(),
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widgetRef.read(onBoardingStepManger.notifier).state = stepValue-1;
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  ProgressStepper(
                    width: 100,
                    stepCount: 2,
                    currentStep: stepValue,
                  ),
                  Text('Help',style: TextStyle(
                    fontSize: screenWidth! * 14 / 375,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),)
                ],
              ),
              const AspectRatio(
                aspectRatio: 375 / 26,
                child: SizedBox(),
              ),
              _screens[stepValue - 1],
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widgetRef.read(onBoardingStepManger.notifier).state = stepValue + 1;
          },
        ),
      ),
    );
  }
}
