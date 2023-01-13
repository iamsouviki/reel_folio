import 'package:flutter/material.dart';
import 'package:reel_folio/screens/create_project(hiring)/category_hiring_page.dart';
import 'package:reel_folio/screens/create_project(hiring)/hiring_page.dart';
import 'package:reel_folio/screens/create_project(hiring)/invite_crew.dart';
import 'package:reel_folio/screens/create_project(hiring)/open_roles_page.dart';
import 'package:reel_folio/util/colors.dart';

import '../CreateProject(Completed)/project_upload.dart';

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
                  MaterialPageRoute(builder: (context) => NewProjectUpload()),
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
                'Upcomming Page',
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
                  MaterialPageRoute(
                      builder: (context) => SelectCategoryScreen()),
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
                'Select Category Page',
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
                  MaterialPageRoute(builder: (context) => openRolesPage()),
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
                'Open Roles Page',
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
                  MaterialPageRoute(builder: (context) => ImportCrew()),
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
                'Import Crew Page',
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
                  MaterialPageRoute(builder: (context) => ImportCrew()),
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
                'Import Crew Page',
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
                  MaterialPageRoute(builder: (context) => reviewScreen()),
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
                'Hiring Page',
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
