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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 12 / 375,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  ProgressStepper(
                    width: 100,
                    stepCount: 3,
                    currentStep: stepValue,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
              const AspectRatio(
                aspectRatio: 375 / 26,
                child: SizedBox(),
              ),
              _screens[stepValue-1],
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          widgetRef.read(onBoardingStepManger.notifier).state = stepValue+1;
        },
      ),
    );
  }
}
