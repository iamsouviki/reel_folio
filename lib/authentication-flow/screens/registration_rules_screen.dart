import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/screens/widget/action_button_widget.dart';
import 'package:reel_folio/authentication-flow/screens/widget/login_button_widget.dart';
import 'package:reel_folio/authentication-flow/screens/widget/rules_widget.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import '../../util/colors.dart';
import '../../util/size_config.dart';

class RegistrationRulesScreen extends StatelessWidget {
  const RegistrationRulesScreen({Key? key}) : super(key: key);

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
                height: screenHeight! * 0.1,
              ),
              const RulesWidget(
                  id: "1",
                  title: "BE AUTHENTIC",
                  description:
                      "make sure your photos, experience, and skills are true to who you are"),
              const RulesWidget(
                  id: "2",
                  title: "BE COLLABORATIVE",
                  description:
                      "this platform was built to bridge disciplines and artistic styles to lower the industry’s barriers to entry"),
              const RulesWidget(
                  id: "3",
                  title: "BE AMBITIOUS",
                  description:
                      "help one another rise in the industry by supporting your fellow filmmakers and sharing skills and resources"),
              SizedBox(
                height: screenHeight! * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.routeToRequestOnBoardingScreen,
                  );
                },
                child: const ActionButtonWidget(buttonText: "Request To Join"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! * 0.025, bottom: screenHeight! * 0.064),
                child: const LoginButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
