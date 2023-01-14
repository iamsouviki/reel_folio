import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/screens/widget/action_button_widget.dart';

import '../../logic/core/login_data.dart';
import '../../util/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  LoginData get _loginDat => GetIt.I<LoginData>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth! * 35 / 375,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AspectRatio(
                  aspectRatio: 375 / 50,
                  child: SizedBox(),
                ),
                Center(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: screenWidth! * 32 / 375,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'GT-America-Compressed-Regular',
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                const AspectRatio(
                  aspectRatio: 375 / 100,
                  child: SizedBox(),
                ),
                Text(
                  'Username',
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth! * 22 / 375),
                ),
                TextField(
                  onChanged: (val) => _loginDat.phoneOrEmail = val,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xFF474747),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth! * 22 / 375,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email or Phone #',
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
                  height: screenWidth! * 22 / 375,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth! * 22 / 375),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  cursorColor: const Color(0xFF474747),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth! * 22 / 375,
                  ),
                  decoration: InputDecoration(
                    hintText: '*******',
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
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: screenWidth! * 250 / 375,
                  ),
                ),
                Center(
                  child: Text(
                    'I forgot my password',
                    style: TextStyle(
                      color: const Color(0xFF7E7E7E),
                      fontSize: screenWidth! * 17 / 375,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth! * 21 / 375,
                ),
                const Center(
                  child: ActionButtonWidget(
                    buttonText: 'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
