import 'package:flutter/material.dart';
import 'package:reel_folio/screens/CastCrew/castcrew.dart';
import 'package:reel_folio/screens/Contacts/contacts_main_list.dart';
import 'package:reel_folio/screens/CreateProject(Completed)/new%20_project.dart';
import 'package:reel_folio/screens/Home/homepage.dart';
import 'package:reel_folio/screens/Notifications/notification.dart';
import 'package:reel_folio/screens/Saved/saved_screen.dart';
import 'package:reel_folio/screens/apply/select_role.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import 'screens/Chat/chatmain.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarybgcolor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth! * 0.5, 40),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Homepage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Homepage",
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ChatMain(),
                    ),
                  );
                },
                child: Text(
                  "Chat",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SavedScreen(),
                    ),
                  );
                },
                child: Text(
                  "Saved",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ContactsMain(),
                    ),
                  );
                },
                child: Text(
                  "Contacts",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => CastCrewScreen(),
                    ),
                  );
                },
                child: Text(
                  "Cast & Crew",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NotificationScreen(),
                    ),
                  );
                },
                child: Text(
                  "Notifications",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectRoleScreen(),
                    ),
                  );
                },
                child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NewProjectWidget(),
                    ),
                  );
                },
                child: Text(
                  "Create Project (Completed)",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth! * 0.5, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
