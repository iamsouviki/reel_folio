import 'package:flutter/material.dart';
import 'package:reel_folio/screens/apply/message.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/screens/widget/default_navbar.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {

  var roles = ["Director", "Cinematographer", "Kry Grip", "Actor", "VFX"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: secondarybgcolor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight! * 60 / 812),
              child: DefaultNavbar(context, "Apply")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: screenHeight!*0.1,),
                const Text(
                  "SELECT ROLE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    // fontFamily: "GT-America-Compressed-Regular",
                  ),
                  textAlign: TextAlign.center,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.2),
                  child: const Text(
                    "What position would you like to be considered for?",
                    style: TextStyle(
                      color: searchTextcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      // fontFamily: "GT-America-Compressed-Regular",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight! * 0.1),
                Container(
                    height: screenHeight! * 0.3,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth! * 0.05, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            roles[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              // fontFamily: "GT-America-Compressed-Regular",
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth! * 0.1, vertical: screenHeight! * 0.05),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth! * 0.1, 50),
                backgroundColor: navbarIconcolor,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(32.0),
                // ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ApplyMessage()));
              },
              // color: Colors.blue,
              // textColor: Colors.white,
              child: const Text('Submit'),
            ),
          ),
        ));
  }
}
