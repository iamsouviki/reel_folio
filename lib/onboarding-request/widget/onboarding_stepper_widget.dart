import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding-request/user_details_screen.dart';
import 'package:reel_folio/onboarding-request/user_social_media_information_screen.dart';

import '../../util/progress_stepper.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final List<Widget> _screens = const [
    UserDetailsScreen(),
    UserSocialMediaInformationScreen(),
  ];

  int stepValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            stepValue++;
          });
          //Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserSocialMediaInformationScreen()));
        },
      ),
    );
  }
}
