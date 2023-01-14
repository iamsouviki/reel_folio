import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/screens/login_screen.dart';
import 'package:reel_folio/util/size_config.dart';
import '../../../util/colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      child: Text(
        "log in",
        style: TextStyle(
          color: ReelfolioColor.usernameColor,
          fontSize: screenWidth! * 15 / 375,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
