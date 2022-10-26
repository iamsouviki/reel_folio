import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/login/manager/login_step_manager.dart';
import 'package:reel_folio/login/widgets/login_phone_widget.dart';
import 'package:reel_folio/onboarding/widget/user_pin_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/floating_action_button_widget.dart';
import 'package:reel_folio/util/progress_stepper.dart';
import 'package:reel_folio/util/size_config.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final List<Widget> _screens = [
    // login page
    LoginPhoneWidget(),
    // pin page
    UserPinWidget(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final stepValue = widgetRef.watch(loginStepManager);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
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
                          widgetRef.read(loginStepManager.notifier).state =
                              stepValue - 1;
                        } else {
                          widgetRef.read(loginStepManager.notifier).state = 1;
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
        ),
        floatingActionButton: FloatingActionButtonWidget(
          onTap: () {
            if (stepValue != 2) {
              widgetRef.read(loginStepManager.notifier).state = stepValue + 1;
            } else {
              // Navigate to some other page
            }
          },
        ),
      ),
    );
  }
}
