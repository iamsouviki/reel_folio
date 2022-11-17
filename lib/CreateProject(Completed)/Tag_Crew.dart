import 'package:flutter/material.dart';
import 'package:reel_folio/CreateProject(Completed)/invite_crew.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/appbar_widget.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/tag_crew_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class tagCrewScreen extends StatefulWidget {
  const tagCrewScreen({Key? key}) : super(key: key);

  @override
  State<tagCrewScreen> createState() => _tagCrewScreenState();
}

class _tagCrewScreenState extends State<tagCrewScreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
            child: CreateProjectNavbar(
                context, "ADD NEW PROJECT", tagCrewScreen())),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: screenHeight! * 0.05,
            ),
            Center(
              child: const Text(
                "TAG CREW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: "GT-America-Compressed-Regular",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight! * 0.05,
            ),
            Text(
              "Tagged",
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return tagCrewWidget();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Add a member",
                  style: TextStyle(
                    color: tagcolor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ]),
        )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth! * 0.25, 0,
              screenWidth! * 0.25, screenHeight! * 0.05),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth! * 0.1, 50),
              backgroundColor: navbarIconcolor,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImportCrew()));
            },
            // color: Colors.blue,
            // textColor: Colors.white,
            child: const Text('Invite'),
          ),
        ),
      ),
    );
  }
}
