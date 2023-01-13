import 'package:flutter/material.dart';
import 'package:reel_folio/screens/login/login_page.dart';
import 'package:reel_folio/screens/login/widgets/tools/screen_small_title_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../onboarding/widget/tools/screen_sub_title_widget.dart';
import '../onboarding/widget/tools/screen_title_widget.dart';
import 'widgets/login_action_button.dart';

class PasswordResetPage extends StatelessWidget {
  PasswordResetPage({super.key});
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
            Row(
              children: [
                SmallTitleWidget(
                  text: "REELFOLIO",
                )
              ],
            ),
            // const AspectRatio(
            //   aspectRatio: 375 / 66,
            //   child: SizedBox(),
            // ),
            SizedBox(
              height: screenWidth! * 20 / 375,
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
              height: screenWidth! * 21 / 375,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: LoginActionButton(buttonText: "Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
