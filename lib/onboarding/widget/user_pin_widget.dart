import 'package:flutter/material.dart';

import '../../util/size_config.dart';
import '../../widget/otp_field.dart';
import 'screen_sub_title_widget.dart';
import 'screen_title_widget.dart';

class UserPinWidget extends StatelessWidget {
  UserPinWidget({Key? key}) : super(key: key);

  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 110,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'ENTER PIN'),
        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        const ScreenSubTitleWidget(
          text:
          'Type the four-digit code that you received via text.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        OtpField(
          numberOfFields: 4,
          obscureText: true,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: screenWidth! * 20 / 375,
          ),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },

          onSubmit: (String verificationCode){

          }, // end onSubmit
        ),
      ],
    );
  }
}
