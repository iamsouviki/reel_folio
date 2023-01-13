import 'package:flutter/material.dart';
import 'package:reel_folio/screens/CreateProject(Completed)/widget/tag_crew_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../create_project(hiring)/hiring_page.dart';
import '../create_project(hiring)/widgets/navbar_widget.dart';

class ImportCrew extends StatefulWidget {
  const ImportCrew({Key? key}) : super(key: key);

  @override
  State<ImportCrew> createState() => _ImportCrewState();
}

class _ImportCrewState extends State<ImportCrew> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: secondarybgcolor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
              child: CreateProjectNavbar(
                  context, "ADD NEW PROJECT", reviewScreen())),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight! * 0.02,
                ),
                Center(
                  child: const Text(
                    "INVITE CREW",
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
                  height: 10,
                ),
                Text(
                  "Type their email below and select their role. Then hit enter.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  // textAlign: TextAlign.center,
                ),
                TextField(
                  maxLines: 4,
                  minLines: 1,
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.3))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.3))),
                    hintText: "email",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: searchBarcolor,
                  ),
                  child: Text(
                    "Add Role",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth! * 0.3, 40),
                      backgroundColor: navbarIconcolor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ImportCrew()));
                    },
                    child: const Text('Invite'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Invited", style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    
                ),),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index){
                  return tagCrewWidget();
                })
              ],
            ),
          )),
        ));
  }
}
