import 'package:flutter/material.dart';
import 'package:reel_folio/screens/project_page/widgets/owner_wrappedup_hero_widget.dart';
import 'package:reel_folio/screens/project_page/widgets/owner_wrappedup_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import 'widgets/project_cast_crew_widget.dart';
import 'widgets/project_detail_widget.dart';

class OwnerWrappedPage extends StatefulWidget {
  const OwnerWrappedPage({super.key});

  @override
  State<OwnerWrappedPage> createState() => _OwnerWrappedPageState();
}

class _OwnerWrappedPageState extends State<OwnerWrappedPage> {
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
                child: OwnerWrappedUpWidget(title: "Complete"),
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
              // Divider(
              //   color: Colors.white.withOpacity(0.4),
              // ),
              // AppliedWidget(),
              // Divider(
              //   color: Colors.white.withOpacity(0.4),
              // ),
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

const skillList = [
  "Art Direction",
  "Actor",
  "Sound Design",
  "Editing",
  "Directing",
];
