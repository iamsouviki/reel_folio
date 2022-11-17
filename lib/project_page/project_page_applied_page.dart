import 'package:flutter/material.dart';
import 'package:reel_folio/project_page/widgets/open_positions_widget.dart';
import 'package:reel_folio/project_page/widgets/project_appbar_widget.dart';
import 'package:reel_folio/project_page/widgets/project_applied_widget.dart';
import 'package:reel_folio/project_page/widgets/project_cast_crew_widget.dart';
import 'package:reel_folio/project_page/widgets/project_detail_widget.dart';
import 'package:reel_folio/project_page/widgets/project_hero_widget.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

const skillList = [
  "Art Direction",
  "Actor",
  "Sound Design",
  "Editing",
  "Directing",
];

class ProjectAppliedPage extends StatefulWidget {
  const ProjectAppliedPage({super.key});

  @override
  State<ProjectAppliedPage> createState() => _ProjectAppliedPageState();
}

class _ProjectAppliedPageState extends State<ProjectAppliedPage> {
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
                child: ProjectPageAppbarWidget(
                  title: "Shoot in 30 Days",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.05,
                    vertical: screenWidth! * 0.05),
                child: ProjectHeroWidget(),
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
              AppliedWidget(),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: OpenPositionsWidget(),
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
            ],
          ),
        ),
      ),
    );
  }
}
