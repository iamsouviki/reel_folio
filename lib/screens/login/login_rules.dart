import 'package:flutter/material.dart';
import 'package:reel_folio/screens/login/login_page.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import 'widgets/login_action_button.dart';
import 'widgets/rules_block_widget.dart';

class LoginRulesPage extends StatefulWidget {
  const LoginRulesPage({super.key});

  @override
  State<LoginRulesPage> createState() => _LoginRulesPageState();
}

class _LoginRulesPageState extends State<LoginRulesPage> {
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
              RulesBlock(
                  id: "1",
                  title: "BE AUTHENTIC",
                  description:
                      "make sure your photos, expierence, and skills are true to who you are"),
              RulesBlock(
                  id: "2",
                  title: "BE COLLABORATIVE",
                  description:
                      "this platform was built to bridge disciplines and artistic styles to lower the industry’s barriers to entry"),
              RulesBlock(
                  id: "3",
                  title: "BE AMBITIOUS",
                  description:
                      "help one another rise in the industry by supporting your fellow filmmakers and sharing skills and resources"),
              SizedBox(
                height: screenHeight! * 0.1,
              ),
              InkWell(
                onTap: () {},
                child: LoginActionButton(buttonText: "Request To Join"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! * 0.025, bottom: screenHeight! * 0.064),
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
