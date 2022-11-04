import 'package:flutter/material.dart';
import 'package:reel_folio/login/login_firstpage.dart';
import 'package:reel_folio/login/login_forgot_password.dart';
import 'package:reel_folio/login/login_password_reset.dart';
import 'package:reel_folio/roles/roles_accept_candidates.dart';
import 'package:reel_folio/roles/roles_see_candidates.dart';
import 'package:reel_folio/settings/settings_main_page.dart';
import 'package:reel_folio/settings/settings_terms_page.dart';
import 'package:reel_folio/util/colors.dart';

class TestRoutePage extends StatelessWidget {
  const TestRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReelfolioColor.shadowColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsMainPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: ReelfolioColor.bgColor,
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                'Settings Main Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsTermsPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: ReelfolioColor.bgColor,
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                'Settings Terms Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
