import 'package:flutter/material.dart';

import '../../util/progress_stepper.dart';

class OnBoardingStepperWidget extends StatelessWidget {
  final int currentStep;

  const OnBoardingStepperWidget({Key? key, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
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
              currentStep: currentStep,
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
      ],
    );
  }
}
