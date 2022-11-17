import 'package:flutter/material.dart';
import 'package:reel_folio/portfolio/widget/portfolio_navbar.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_font_family.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import '../util/size_config.dart';

class PortfolioMyPage extends StatefulWidget {
  const PortfolioMyPage({super.key});

  @override
  State<PortfolioMyPage> createState() => _PortfolioMyPageState();
}

class _PortfolioMyPageState extends State<PortfolioMyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    ReelfolioImageAsset.portfolioReelPreview,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth! * 0.05,
                            vertical: screenHeight! * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                ReelFolioIcon.iconArrowBackward,
                              ),
                            ),
                            Image.asset(
                              ReelFolioIcon.iconMenu,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight! * 0.35,
                      ),
                      Container(
                        height: screenHeight! * 0.465,
                        width: screenWidth!,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              ReelfolioColor.shadowColor.withOpacity(0),
                              ReelfolioColor.shadowColor.withOpacity(0.8)
                            ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 0.05),
                                  child:
                                      Image.asset(ReelFolioIcon.reelPlayButton),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 0.08),
                                  child: const Text(
                                    "MATTHEW SAFFORD",
                                    style: TextStyle(
                                      fontFamily: "GT-America-Extended-Bold",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 0.08,
                                      vertical: screenHeight! * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "DIRECTOR",
                                        style: TextStyle(
                                          fontFamily:
                                              "GT-America-Extended-Bold",
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Image.asset(ReelFolioIcon.saveButton),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.08,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1),
                        minimumSize: Size(screenWidth! * 0.2, 30),
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 0.04,
                        ),
                      ),
                      child: const Text(
                        "Edit Portfolio",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(ReelFolioIcon.iconArrowDownward),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.1,
                  vertical: screenHeight! * 0.005,
                ),
                width: screenWidth!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ReelfolioImageAsset.portfolioDp),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "This is my personal bio and desctiption of what im doing on this platform",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              Container(
                height: screenHeight! * 0.06,
                width: screenWidth!,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                      child: const Text(
                        "Skills",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight! * 0.01,
                      ),
                      width: screenWidth! * 0.75,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemCount: skillList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth! * 0.02),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
                                  minimumSize: Size(screenWidth! * 0.2, 30),
                                  backgroundColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth! * 0.04,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              child: Text(
                                skillList[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 0.05,
                        vertical: screenHeight! * 0.01),
                    child: const Text(
                      "Hiring",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight! * 0.2,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth! * 0.05,
                            vertical: screenHeight! * 0.01),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(ReelfolioImageAsset
                                      .portfolioHiringProject),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenHeight! * 0.02),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const <Widget>[
                                        Text(
                                          "PROJECT TITLE",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "3 Open Positions",
                                          style: TextStyle(
                                            color: Color(0xff9997EC),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 40),
                                    child: Text(
                                      "May 5th",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ]),
                            const Divider(
                              color: Colors.white,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.03,
                  vertical: screenHeight! * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "My Work",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: screenHeight! * 0.3,
                child: ListView.builder(
                  itemCount: 10,
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
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
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
                              Image.asset(ReelfolioImageAsset.portfolioWork),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}

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

const skillList = [
  "Art Direction",
  "Actor",
  "Sound Design",
  "Editing",
  "Directing",
];
