import 'package:flutter/material.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/appbar_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class tagCrewScreen extends StatefulWidget {
  const tagCrewScreen({Key? key}) : super(key: key);

  @override
  State<tagCrewScreen> createState() => _tagCrewScreenState();
}

class _tagCrewScreenState extends State<tagCrewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
            child: CreateProjectNavbar(
                context, "ADD NEW PROJECT", tagCrewScreen())),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
            ]
          )
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
              screenWidth! * 0.25, 0, screenWidth! * 0.25, screenHeight! * 0.05),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth! * 0.1, 50),
              backgroundColor: navbarIconcolor,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(32.0),
              // ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const tagCrewScreen()));
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
