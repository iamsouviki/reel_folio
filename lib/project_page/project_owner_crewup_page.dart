import 'package:flutter/material.dart';
import 'package:reel_folio/project_page/widgets/open_position_row_widget.dart';
import 'package:reel_folio/project_page/widgets/owner_wrappedup_hero_widget.dart';
import 'package:reel_folio/project_page/widgets/owner_wrappedup_widget.dart';
import 'package:reel_folio/project_page/widgets/project_appbar_widget.dart';
import 'package:reel_folio/project_page/widgets/project_applied_widget.dart';
import 'package:reel_folio/project_page/widgets/project_cast_crew_widget.dart';
import 'package:reel_folio/project_page/widgets/project_detail_widget.dart';
import 'package:reel_folio/project_page/widgets/wrappedup_hero_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class OwnerCrewUpPage extends StatefulWidget {
  const OwnerCrewUpPage({super.key});

  @override
  State<OwnerCrewUpPage> createState() => _OwnerCrewUpPageState();
}

class _OwnerCrewUpPageState extends State<OwnerCrewUpPage> {
  String title = "Crewing Up";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.05),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth! * 0.05,
                      vertical: screenHeight! * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ReelFolioIcon.iconArrowBackward),
                      Container(
                        decoration: BoxDecoration(
                          color: ReelfolioColor.buttonColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: ReelfolioColor.bgColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth! * 0.02,
                              horizontal: screenWidth! * 0.02),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: ReelfolioColor.shadowColor,
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.05,
                    vertical: screenWidth! * 0.05),
                child: OwnerWrappedUpHeroWidget(),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: CastAndCrewWidget(),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.05,
                    vertical: screenWidth! * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shoot Date",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "10.05.2020",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(ReelFolioIcon.iconSmallArrowForward),
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Applications",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Image.asset(ReelFolioIcon.iconSmallArrowForward),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            OpenPositionRowWidget(),
                            Divider(
                              color: Colors.white.withOpacity(0.4),
                              thickness: 1,
                            ),
                            OpenPositionRowWidget(),
                            Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            OpenPositionRowWidget(),
                            Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: ProjectDetailWidget(),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.05,
                    vertical: screenWidth! * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth!,
                    height: screenWidth! * 0.1,
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
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
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
                ],
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const skillList = [
  "Art Direction",
  "Actor",
  "Sound Design",
  "Editing",
  "Directing",
];
