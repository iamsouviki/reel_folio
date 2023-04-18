import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/login_data.dart';

import '../../Api/config.dart';
import '../../util/size_config.dart';
import '../../widget/otp_field.dart';
import 'tools/screen_sub_title_widget.dart';
import 'tools/screen_title_widget.dart';
import 'package:reel_folio/Api/api.dart';

class UserPinWidget extends StatefulWidget {
  UserPinWidget({Key? key}) : super(key: key);

  @override
  State<UserPinWidget> createState() => _UserPinWidgetState();
}

class _UserPinWidgetState extends State<UserPinWidget> {
  final _pinController = TextEditingController();

  LoginData get _loginData => GetIt.I<LoginData>();

  bool shoWPassword = false;

  bool otpLogin = true;

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
          height: screenWidth! * 10 / 375,
        ),
        ScreenSubTitleWidget(
          text: "Type your ${otpLogin ? 'otp' : 'password'}",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        SizedBox(
          height: 100,
          child: otpLogin
              ? OtpField(
                  numberOfFields: 4,
                  obscureText: true,
                  cursorColor: Colors.grey,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth! * 20 / 375,
                  ),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    _loginData.password = verificationCode;
                  }, // end onSubmit
                )
              : TextField(
                  obscureText: !shoWPassword,
                  controller: _pinController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xFF474747),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth! * 22 / 375,
                  ),
                  onChanged: (val) {
                    _loginData.password = val;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: !shoWPassword
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                shoWPassword = !shoWPassword;
                              });
                            },
                            child: const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            ))
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                shoWPassword = !shoWPassword;
                              });
                            },
                            child: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            )),
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
        ),
        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        SizedBox(
          height: 50,
          child: otpLogin
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      otpLogin = false;
                    });
                    _loginData.isotp = false;
                  },
                  child: const ScreenSubTitleWidget(
                    text: "Login with password",
                    textAlign: TextAlign.center,
                  ),
                )
              : GestureDetector(
                  onTap: () async {
                    setState(() {
                      otpLogin = true;
                    });
                    var res = await Api().fetchToken(OAUTH_URL);
                    await Api().postMethod(
                        SEND_OTP,
                        {'email': _loginData.phoneOrEmail},
                        res['access_token']);
                    _loginData.isotp = true;
                  },
                  child: const ScreenSubTitleWidget(
                    text: "Login with otp",
                    textAlign: TextAlign.center,
                  ),
                ),
        )
      ],
    );
  }
}
