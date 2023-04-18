import 'package:flutter/material.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/about_movie_widget.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/appbar_widget.dart';
import 'package:reel_folio/util/asset.dart';

import '../util/colors.dart';
import '../util/size_config.dart';

class reviewScreen extends StatefulWidget {
  const reviewScreen({Key? key}) : super(key: key);

  @override
  State<reviewScreen> createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {
  var skill = [
    "Actor",
    "Director",
    "Cinematographer",
    "Writer",
    "Producer",
    "Editor",
    "Sound Designer",
    "Composer",
    "Production Designer",
    "Costume Designer",
    "Makeup Artist",
    "VFX Artist",
    "Stunt Coordinator",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: secondarybgcolor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
                child: CreateProjectNavbar(context, "REVIEW", null, stopRoute: true)),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight! * 0.02,
                ),
                Center(child: Image.asset(ReelfolioImageAsset.projectReview)),
                SizedBox(
                  height: screenHeight! * 0.02,
                ),
                Center(
                  child: Text("Title",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ),
                const Center(
                  child: Text("My Movie",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.7),
                  thickness: 1,
                ),
                aboutMovieWidget("Logline", "something about something"),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 1,
                  indent: screenWidth! * 0.3,
                ),
                aboutMovieWidget("Project details",
                    "this movie is about this expierence i once had that really shaped me"),
                Divider(
                  color: Colors.white.withOpacity(0.7),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                    children: [
                      Text("Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      const Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: secondaryTextColor2,
                        ),
                        child: Text(
                          "Complete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Cast and Crew",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Image.asset(ReelfolioImageAsset.chatProfilePic, height: 25),
                          Image.asset(ReelfolioImageAsset.chatProfilePic, height: 25),
                          Image.asset(ReelfolioImageAsset.chatProfilePic, height: 25),
                          Image.asset(ReelfolioImageAsset.chatProfilePic, height: 25),
                          const Spacer(),
                          Text("@williamerwin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          Text(" and 4 others",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: const Text("Category",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Container(
                            width: screenWidth!,
                            height: screenWidth! * 0.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              // Hardcoded for now
                              itemCount: skill.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 0.02),
                                  child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        skill[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Colors.white, width: 1),
                                          minimumSize:
                                          Size(screenWidth! * 0.2, 30),
                                          backgroundColor: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth! * 0.04,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ))),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 1,
                ),
                SizedBox(
                  height: screenHeight! * 0.1,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth! * 0.3, 40),
                      backgroundColor: deletebuttoncolor,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                    },
                    child: const Text('Delete'),
                  ),),
                SizedBox(
                  height: 15,
                ),
              ],
            ))));
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: primarybgcolor,
    // title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(

            child: Text("Are you sure you want \nto DELETE?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )
            )),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewScreen()),
                );
              },
              child: Text(
                "NO",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(100, 40),
                backgroundColor: searchBarcolor,
                side: BorderSide(color: Colors.white),
              ),
            ),
            SizedBox(width:10),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              child: Text(
                "YES",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(100, 40),
                backgroundColor: deletebuttoncolor,
                side: BorderSide(color: Colors.white),
              ),
            )
          ],
        )
      ],
    ),
  );
}
