import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/services/login_data.dart';

import '../../../../util/size_config.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _pinController = TextEditingController();

  LoginData get _loginData => GetIt.I<LoginData>();

  bool shoWPassword = false;

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
        const ScreenSubTitleWidget(
          text: 'Type your password',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        TextField(
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
        /*OtpField(
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

          onSubmit: (String verificationCode){

          }, // end onSubmit
        ),*/
      ],
    );
  }
}
