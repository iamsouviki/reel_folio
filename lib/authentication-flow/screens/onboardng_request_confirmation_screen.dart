import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../screens/route/route_path.dart';
import 'widget/action_button_widget.dart';
import 'widget/screen_title_widget.dart';


class OnBoardingRequestConfirmationScreen extends StatelessWidget {
  const OnBoardingRequestConfirmationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 70 / 375,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AspectRatio(
                  aspectRatio: 373 / 250,
                  child: SizedBox(),
                ),
                const ScreenTitleWidget(text: 'THANK YOU'),
                const AspectRatio(
                  aspectRatio: 373 / 20,
                  child: SizedBox(),
                ),
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: screenWidth! * 18 / 375,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                const AspectRatio(
                  aspectRatio: 373 / 40,
                  child: SizedBox(),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: screenWidth! * 18 / 375,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                const AspectRatio(
                  aspectRatio: 373 / 360,
                  child: SizedBox(),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: const ActionButtonWidget(buttonText: "Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String text1 =
    'It normally takes us 3-5 days to review and get back to you with an invite. We’ll be in touch.';

String text2 = 'Make sure to look out for an email from us.';
