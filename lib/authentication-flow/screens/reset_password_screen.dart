import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/screens/widget/action_button_widget.dart';
import 'package:reel_folio/screens/route/route_path.dart';

import '../../screens/onboarding/widget/tools/screen_sub_title_widget.dart';
import '../../screens/onboarding/widget/tools/screen_title_widget.dart';
import '../../util/colors.dart';
import '../../util/size_config.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AspectRatio(
              aspectRatio: 375 / 70,
              child: SizedBox(),
            ),
            const ScreenTitleWidget(
              text: 'PASSWORD RESET',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenWidth! * 22 / 375,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
              child: Text(
                'Happens to us all! Let’s get it sorted.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.4),
                  fontSize: screenWidth! * 14 / 375,
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenWidth! * 30 / 375,
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
                  child: const ScreenSubTitleWidget(
                    text: 'New Password',
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xFF474747),
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 22 / 375,
                ),
                decoration: InputDecoration(
                  hintText: '**********',
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth! * 0.15, top: screenWidth! * 0.05),
                  child: const ScreenSubTitleWidget(
                    text: 'Confirm New Password',
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
              child: TextField(
                controller: _newPasswordController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xFF474747),
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 22 / 375,
                ),
                decoration: InputDecoration(
                  hintText: '**********',
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
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.05),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutePath.routeToLoginScreen,
                    ModalRoute.withName('/'),
                  );
                },
                child: const ActionButtonWidget(buttonText: "Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
