import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/screens/widget/action_button_widget.dart';
import 'package:reel_folio/screens/route/route_path.dart';

import '../../util/asset.dart';
import '../../util/colors.dart';
import '../../util/size_config.dart';
import 'widget/login_button_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight! * 170 / 812,
              ),
              Image.asset(ReelfolioImageAsset.loginTitle),
              SizedBox(
                height: screenHeight! * 0.12,
              ),
              Text(
                "Where the world’s best filmmakers come together.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 14 / 375,
                ),
              ),
              SizedBox(
                height: screenHeight! * 0.14,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.routeToRequestOnBoardingScreen,
                  );
                },
                child: const ActionButtonWidget(buttonText: "Get Started"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! * 0.025, bottom: screenHeight! * 0.05),
                child: const LoginButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
