import 'package:flutter/material.dart';
import 'package:reel_folio/login/login_page.dart';
import 'package:reel_folio/login/login_rules.dart';
import 'package:reel_folio/login/widgets/login_action_button.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class LoginFirstPage extends StatefulWidget {
  const LoginFirstPage({super.key});

  @override
  State<LoginFirstPage> createState() => _LoginFirstPageState();
}

class _LoginFirstPageState extends State<LoginFirstPage> {
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
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: screenHeight! * 0.14,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginRulesPage()),
                  );
                },
                child: LoginActionButton(buttonText: "Get Started"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! * 0.025, bottom: screenHeight! * 0.05),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "log in",
                    style: TextStyle(
                      color: ReelfolioColor.buttonColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
