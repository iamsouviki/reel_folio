import 'package:flutter/material.dart';
import 'package:reel_folio/project_page/project_owner_crewup_page.dart';
import 'package:reel_folio/project_page/project_owner_wrapped_page.dart';
import 'package:reel_folio/project_page/project_page_applied_page.dart';
import 'package:reel_folio/project_page/project_request_tag_page.dart';
import 'package:reel_folio/project_page/project_wrapped_page.dart';
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
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectWrappedPage()),
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
                'Project Wrapped up Page',
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
                  MaterialPageRoute(builder: (context) => OwnerWrappedPage()),
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
                'Owner Wrapped up Page',
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
                  MaterialPageRoute(builder: (context) => OwnerCrewUpPage()),
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
                'Owner Crew up Page',
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
                  MaterialPageRoute(builder: (context) => RequestTagPage()),
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
                'Request to Tag Page',
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
