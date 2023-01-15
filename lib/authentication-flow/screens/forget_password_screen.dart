import 'package:flutter/material.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import '../../util/colors.dart';
import '../../util/size_config.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/action_button_widget.dart';
import 'widget/screen_title_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AspectRatio(
              aspectRatio: 375 / 70,
              child: SizedBox(),
            ),
            const ScreenTitleWidget(
              text: 'FORGOT PASSWORD',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenWidth! * 22 / 375,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
              child: Text(
                'Happens to us all! Let’s get it sorted. Enter the email associated with your account below.',
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
                    text: 'Email',
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.15),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xFF474747),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 22 / 375,
                ),
                decoration: InputDecoration(
                  hintText: 'reel@reelfolio.com',
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
            // SizedBox(
            //   height: screenHeight! * 0.4,
            // ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.05),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.routeToResetPasswordScreen);
                },
                child: const ActionButtonWidget(buttonText: "Send Recovery Link"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
