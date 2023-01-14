import 'package:flutter/material.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import 'package:reel_folio/util/size_config.dart';
import '../../../util/colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.routeToLoginScreen,
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
