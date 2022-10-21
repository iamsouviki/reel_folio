import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class PortfolioEditPage extends StatefulWidget {
  const PortfolioEditPage({super.key});

  @override
  State<PortfolioEditPage> createState() => _PortfolioEditPageState();
}

class _PortfolioEditPageState extends State<PortfolioEditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: ReelfolioColor.bgColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth! * 0.05,
                      vertical: screenHeight! * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(ReelFolioIcon.iconArrowBackward),
                      Text(
                        "Edit Portfolio",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: Colors.white.withOpacity(0.3),
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(ReelfolioImageAsset.portfolioDp),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight! * 0.02),
                            child: Text("@Werwin",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth! * 0.35,
                      ),
                      Image.asset(ReelFolioIcon.iconSmallArrowForward),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Will Erwin",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        child: Container(),
                      ),
                      Image.asset(ReelFolioIcon.iconSmallArrowForward)
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                  indent: screenWidth! * 0.3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth! * 0.2),
                          child: Text(
                            "Tell us about you. What are your four favorite movies? Are you repped? Here’s the spot to tell everyone! Start a conversation.",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Position",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Image.asset(ReelFolioIcon.iconSmallArrowForward),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      // vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Director",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 1),
                              minimumSize: Size(screenWidth! * 0.2, 30),
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth! * 0.04,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ))),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Skills",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Image.asset(ReelFolioIcon.iconSmallArrowForward),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight! * 0.04,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    // Hardcoded for now
                    itemCount: skillList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth! * 0.02),
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              skillList[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 1),
                                minimumSize: Size(screenWidth! * 0.2, 30),
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth! * 0.04,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight! * 0.01),
                  child: Divider(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.015,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Reel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight! * 0.01),
                            child: Image.asset(
                                ReelfolioImageAsset.portfolioEditReelPreview),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              color: Color(0xff3F3F3F),
                              child: Text(
                                "Upload New",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.01,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Work",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Image.asset(ReelFolioIcon.iconSmallArrowForward),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                  child: SizedBox(
                    height: screenHeight! * 0.5,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight! * 0.01),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                            ReelfolioImageAsset.portfolioWork),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100, right: 5, top: 5),
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: Color(0xff5450EC),
                                            height: 20,
                                            width: 50,
                                            child: const Text(
                                              "Hiring",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "PROJECT TITLE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "OWNER",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight! * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      ReelfolioImageAsset.portfolioWork),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      "PROJECT TITLE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "ROLE",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "My Credits",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * 0.02,
                      horizontal: screenWidth! * 0.05),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(ReelfolioImageAsset.portfolioHiringProject),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth! * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "DIRECTOR",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Project Name",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(),
                          flex: 1,
                        ),
                        Image.asset(ReelFolioIcon.iconMenu)
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

const skillList = [
  "Art Direction",
  "Actor",
  "Sound Design",
  "Editing",
  "Directing",
];

const workList = [
  {
    "image": ReelfolioImageAsset.portfolioWork,
    "title": "Project Title",
    "description": "Owner",
  },
  {
    "image": ReelfolioImageAsset.portfolioWork,
    "title": "Project Title",
    "description": "Role",
  }
];
