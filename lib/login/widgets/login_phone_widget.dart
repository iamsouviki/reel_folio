import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/tools/screen_sub_title_widget.dart';
import 'package:reel_folio/onboarding/widget/tools/screen_title_widget.dart';
import 'package:reel_folio/util/size_config.dart';

class LoginPhoneWidget extends StatelessWidget {
  LoginPhoneWidget({super.key});
  final _contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight! * 0.05,
        ),
        const Center(
          child: Text(
            'LOG IN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontFamily: 'GT-America-Compressed-Regular',
              letterSpacing: -0.1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const AspectRatio(
          aspectRatio: 475 / 150,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(
          text: 'ENTER THE PHONE # ASSOCIATED WITH YOUR ACCOUNT',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 22 / 375,
        ),
        const ScreenSubTitleWidget(
          text: 'We’ll send you a one-time pin to login to your account. ',
        ),
        SizedBox(
          height: screenWidth! * 21 / 375,
        ),
        TextField(
          controller: _contactNumberController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'email or phone #',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
