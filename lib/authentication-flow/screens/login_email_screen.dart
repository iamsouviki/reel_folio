import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/manager/authentication_manager.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import '../screens/widget/action_button_widget.dart';
import '../services/auth_service.dart';

import '../services/login_data.dart';
import '../../util/size_config.dart';
import 'login_password_screen.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  LoginData get _loginData => GetIt.I<LoginData>();

  AuthService get _authService => GetIt.I<AuthService>();

  final ValueNotifier<bool> _loadingNotifier = ValueNotifier<bool>(false);

  bool shoWPassword = false;

  @override
  Widget build(BuildContext context) {

    moveToPasswordScreen(){
      Navigator.pushNamed(
        context,
        RoutePath.routeToPasswordOTPScreen,
      );
    }

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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
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
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight! * 34 / 812,
                ),
                Center(
                  child: Text(
                    'Enter THE email or phone ASSOCIATED WITH YOUR ACCOUNT'
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: screenWidth! * 35 / 375,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const AspectRatio(
                  aspectRatio: 375 / 100,
                  child: SizedBox(),
                ),
                TextField(
                  onChanged: (val) => _loginData.phoneOrEmail = val,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
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
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: screenWidth! * 150 / 375,
                  ),
                ),
                /*Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePath.routeToForgetPasswordScreen,
                      );
                    },
                    child: Text(
                      'I forgot my password',
                      style: TextStyle(
                        color: const Color(0xFF7E7E7E),
                        fontSize: screenWidth! * 17 / 375,
                      ),
                    ),
                  ),
                ),*/
                SizedBox(
                  height: screenWidth! * 21 / 375,
                ),
                Center(
                  child: ValueListenableBuilder(
                    valueListenable: _loadingNotifier,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return value
                          ? const CircularProgressIndicator()
                          : Consumer(
                              builder: (BuildContext context, WidgetRef ref,
                                  Widget? child) {
                                return InkWell(
                                  onTap: () async {
                                    if (_loginData.phoneOrEmail != null) {
                                      _loadingNotifier.value = true;

                                      OTPResponse? response =
                                          await _authService.sendOTP(_loginData.phoneOrEmail!);

                                      if(response!=null){
                                        if (!response.success!) {
                                          _loadingNotifier.value = false;
                                          ref.refresh(otpManager(''));
                                          print(response.message);
                                          showMessage(
                                              context, response.message!);
                                        } else {
                                          _loadingNotifier.value = false;
                                          moveToPasswordScreen();
                                        }
                                      }
                                    } else {
                                      showMessage(context,
                                          'Please add proper credentials');
                                    }
                                  },
                                  child: const ActionButtonWidget(
                                    buttonText: 'Get OTP',
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
