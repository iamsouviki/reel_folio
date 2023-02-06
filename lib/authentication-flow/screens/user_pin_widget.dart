import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';

import '../../screens/widget/otp_field.dart';
import '../../util/size_config.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserPinWidget extends StatelessWidget {
  UserPinWidget({Key? key}) : super(key: key);

  final _pinController = TextEditingController();

  OnBoardingUserDetailsModel get _userModel =>
      GetIt.I<OnBoardingUserDetailsModel>();

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
          text: 'Type the four-digit code that you received via text.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        OtpField(
          numberOfFields: 4,
          obscureText: true,
          cursorColor: Colors.grey,
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

          onSubmit: (String verificationCode) {
            _userModel.otpAdded = verificationCode;
          }, // end onSubmit
        ),
      ],
    );
  }
}

class UserPasswordWidget extends StatefulWidget {
  UserPasswordWidget({Key? key}) : super(key: key);

  @override
  State<UserPasswordWidget> createState() => _UserPasswordWidgetState();
}

class _UserPasswordWidgetState extends State<UserPasswordWidget> {
  final _pinController = TextEditingController();

  OnBoardingUserDetailsModel get _userModel =>
      GetIt.I<OnBoardingUserDetailsModel>();

  bool shoWPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 110,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'ENTER PASSWORD'),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        const ScreenSubTitleWidget(
          text: 'Password',
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: screenWidth! * 1 / 375,
        ),
        TextField(
          obscureText: !shoWPassword,
          onChanged: (val) => _userModel.password = val,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'Enter password',
            suffix: InkWell(
              onTap: () {
                setState(() {
                  shoWPassword = !shoWPassword;
                });
              },
              child: shoWPassword
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
            ),
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
        SizedBox(
          height: screenWidth! * 20 / 375,
        ),
        const ScreenSubTitleWidget(
          text: 'Confirm Password',
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: screenWidth! * 1 / 375,
        ),
        TextField(
          obscureText: !showConfirmPassword,
          onChanged: (val) => _userModel.confirmPassword = val,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'Confirm password',
            suffix: InkWell(
              onTap: () {
                setState(() {
                  showConfirmPassword = !showConfirmPassword;
                });
              },
              child: showConfirmPassword
                  ? const Icon(
                Icons.visibility,
                color: Colors.white,
              )
                  : const Icon(
                Icons.visibility_off,
                color: Colors.white,
              ),
            ),
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
