import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import '../screens/widget/action_button_widget.dart';
import '../services/auth_service.dart';

import '../services/login_data.dart';
import '../../util/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginData get _loginData => GetIt.I<LoginData>();

  AuthService get _authService => GetIt.I<AuthService>();

  final ValueNotifier<bool> _loadingNotifier = ValueNotifier<bool>(false);

  bool shoWPassword = false;

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
                  obscureText: !shoWPassword,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  cursorColor: const Color(0xFF474747),
                  onChanged: (val) => _loginData.password = val,
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
                                        'Please check your credentails');
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
