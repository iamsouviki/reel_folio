import 'package:flutter/material.dart';
import 'package:reel_folio/portfolio/widget/portfolio_navbar.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_font_family.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import '../util/size_config.dart';

// Building the page in 1 widget. Will break later.

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.bgColor,
        // TODO: Fix AppBar transparent issue
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
                      SizedBox(
                        height: screenHeight! * 0.45,
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
                                  child: Text(
                                    "MATTHEW SAFFORD",
                                    style: TextStyle(
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
                                      Text(
                                        "DIRECTOR",
                                        style: TextStyle(
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
                    vertical: screenHeight! * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff394A71),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Add to Contacts",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Image.asset(ReelFolioIcon.iconArrowDownward),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.1,
                  vertical: screenHeight! * 0.01,
                ),
                width: screenWidth!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ReelfolioImageAsset.portfolioDp),
                    // Couldn't fix text overflow
                    Text(
                      "This is my personal bio",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                height: screenHeight! * 0.08,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Skills",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SingleChildScrollView(
                      child: Row(),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
