import 'package:flutter/material.dart';
import 'package:reel_folio/login/login_firstpage.dart';
import 'package:reel_folio/login/login_forgot_password.dart';
import 'package:reel_folio/login/login_password_reset.dart';
import 'package:reel_folio/roles/roles_see_candidates.dart';
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
                  MaterialPageRoute(builder: (context) => LoginFirstPage()),
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
                'Login Landing Page',
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
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                // primary: ReelfolioColor.primaryColor,
                backgroundColor: ReelfolioColor.bgColor,
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                'Forgot Password Page',
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
                  MaterialPageRoute(builder: (context) => PasswordResetPage()),
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
                'Password Reset Page',
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
                  MaterialPageRoute(builder: (context) => SeeCandidatesPage()),
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
                'See Candidates Page',
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
