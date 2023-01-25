import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/util/colors.dart';

import '../../screens/widget/otp_field.dart';
import '../../util/size_config.dart';
import '../services/auth_service.dart';
import '../services/login_data.dart';
import 'widget/action_button_widget.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({Key? key}) : super(key: key);

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  LoginData get _loginData => GetIt.I<LoginData>();

  AuthService get _authService => GetIt.I<AuthService>();

  final ValueNotifier<bool> _loadingNotifier = ValueNotifier<bool>(false);

  final bool shoWPassword = false;

  bool withPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 35 / 375,
          ),
          child: SingleChildScrollView(
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
                  height: screenHeight! * 42 / 812,
                ),
                if (withPassword) const PasswordWidget(),
                if (!withPassword) const OTPWidget(),
                SizedBox(
                  height: screenHeight! * 60 / 812,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        withPassword = !withPassword;
                      });
                    },
                    child: Text(
                      'Login with ${withPassword ? 'OTP' : 'Password'}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: ReelfolioColor.buttonColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth! * 350 / 375,
                ),
                Center(
                  child: Offstage(
                    offstage: !withPassword,
                    child: ValueListenableBuilder(
                      valueListenable: _loadingNotifier,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return value
                            ? const CircularProgressIndicator()
                            : InkWell(
                                onTap: () async {
                                  if (_loginData.phoneOrEmail != null &&
                                      _loginData.password != null) {
                                    _loadingNotifier.value = true;

                                    bool response =
                                        await _authService.loginWithPassword();
                                    if (!response) {
                                      showMessage(context,
                                          'Please check your credentials');
                                      _loadingNotifier.value = false;
                                    } else {
                                      showDialog(context: context, builder: (_){
                                        return const AlertDialog(
                                          content: Text('Logged In Successfully'),
                                        );
                                      });
                                      _loadingNotifier.value = false;
                                    }
                                  } else {
                                    showMessage(
                                        context, 'Please add your credentials');
                                  }
                                },
                                child: const ActionButtonWidget(
                                  buttonText: 'Login',
                                ),
                              );
                      },
                    ),
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

class OTPWidget extends StatefulWidget {
  const OTPWidget({Key? key}) : super(key: key);

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  AuthService get _authService => GetIt.I<AuthService>();

  bool? correctOTP;

  Color boxColor() {
    if (correctOTP == null) {
      return Colors.white;
    } else if (correctOTP == true) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Color fillColor() {
    if (correctOTP == null) {
      return Colors.transparent;
    } else if (correctOTP == true) {
      return Colors.green.withOpacity(0.2);
    } else {
      return Colors.red.withOpacity(0.2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: OtpField(
        numberOfFields: 4,
        obscureText: true,
        borderColor: boxColor(),
        disabledBorderColor: boxColor(),
        enabledBorderColor: boxColor(),
        filled: true,
        fillColor: fillColor(),
        cursorColor: Colors.grey,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: screenWidth! * 20 / 375,
        ),
        showFieldAsBox: true,
        onSubmit: (String verificationCode) async {
          bool resp = await _authService.loginWithOTP(
            int.parse(verificationCode),
          );
          setState(() {
            correctOTP = resp;
          });
          if(resp){
            showDialog(context: context, builder: (_){
              return const AlertDialog(
                content: Text('Logged In Successfully'),
              );
            });
          }
        }, // end onSubmit
      ),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  LoginData get _loginData => GetIt.I<LoginData>();
  bool shoWPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !shoWPassword,
      onChanged: (val) => _loginData.password = val,
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
    );
  }
}
