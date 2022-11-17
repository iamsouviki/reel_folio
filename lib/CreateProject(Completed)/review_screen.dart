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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: secondarybgcolor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
                child: CreateProjectNavbar(context, "REVIEW", reviewScreen())),
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text("Cast and Crew",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ))));
  }
}
