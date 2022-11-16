import 'package:flutter/material.dart';
import 'package:reel_folio/project_page/project_page_applied_page.dart';
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
                  MaterialPageRoute(builder: (context) => ProjectAppliedPage()),
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
                'Project Applied Page',
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
