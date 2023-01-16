import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../screens/widget/otp_field.dart';
import '../../util/size_config.dart';
import '../services/auth_service.dart';
import '../services/login_data.dart';
import 'widget/action_button_widget.dart';

class LoginPasswordScreen extends StatelessWidget {

  LoginPasswordScreen({Key? key}) : super(key: key);

  LoginData get _loginData => GetIt.I<LoginData>();

  AuthService get _authService => GetIt.I<AuthService>();

  final ValueNotifier<bool> _loadingNotifier = ValueNotifier<bool>(false);

  final bool shoWPassword = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AspectRatio(
                aspectRatio: 375 / 50,
                child: SizedBox(),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(flex: 5,),
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
                  const Spacer(flex: 6,),
                ],
              ),
              SizedBox(
                height: screenHeight! * 34 / 812,
              ),
              const AspectRatio(
                aspectRatio: 375 / 80,
                child: SizedBox(),
              ),
              TextField(
                onChanged: (val) => _loginData.phoneOrEmail = val,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xFF474747),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 22 / 375,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter password',
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
              const Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth! * 20 / 375,
              ),
              const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenWidth! * 16 / 375,
              ),
              Flexible(
                flex: 1,
                child: OtpField(
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
                ),
              ),
              SizedBox(
                height: screenWidth! * 21 / 375,
              ),
              Center(
                child: ValueListenableBuilder(
                  valueListenable: _loadingNotifier,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return value
                        ? const CircularProgressIndicator()
                        : InkWell(
                            onTap: () async {
                              if (_loginData.phoneOrEmail != null &&
                                  _loginData.password != null) {
                                _loadingNotifier.value = true;

                                bool response = await _authService.login();

                                if (!response) {
                                  _loadingNotifier.value = false;
                                  showMessage(context,
                                      'Please check your credentials');
                                } else {
                                  _loadingNotifier.value = false;
                                  _loginData.clearData();
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
            ],
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
