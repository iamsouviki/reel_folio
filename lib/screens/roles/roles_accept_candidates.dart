import 'package:flutter/material.dart';
import 'package:reel_folio/screens/roles/widgets/accepted_profile_widget.dart';
import 'package:reel_folio/screens/roles/widgets/app_bar_widget.dart';
import 'package:reel_folio/screens/roles/widgets/applied_profile_widget.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class AcceptCandidatesPage extends StatelessWidget {
  const AcceptCandidatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = "helee";
    final username = "@helee";
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: ReelfolioColor.shadowColor,
          body: Column(
            children: [
              RolesAppBar(title: "Roles & Applications"),
              Divider(
                color: Colors.white.withOpacity(0.6),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight! * 32 / 812,
                    bottom: screenHeight! * 16 / 812),
                child: Text(
                  "DIRECTOR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth! * 22 / 375,
                    fontWeight: FontWeight.w700,
                    fontFamily: "GT-America-Compressed-Regular",
                  ),
                ),
                // RoleScreenTitleWidget(
                //   text: "PROJECT TITLE",
                //   textAlign: TextAlign.center,
                // ),
              ),
              Text(
                "2/2 Filed",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth! * 17 / 375,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight! * 20 / 812),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.02),
                child: Row(
                  children: [
                    Text(
                      "ACCEPTED",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: screenWidth! * 14 / 375,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                // padding: EdgeInsets.only(top: screenHeight! * 20 / 812),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.02),
                child: AcceptedProfileWidget(
                    name: "Cole Jones", username: "@singlethought"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenWidth! * 0.01,
                  left: screenWidth! * 0.04,
                  right: screenWidth! * 0.04,
                ),
                child: Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1,
                ),
              ),
              Padding(
                // padding: EdgeInsets.only(top: screenHeight! * 20 / 812),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.04,
                ),
                child: AcceptedProfileWidget(
                    name: "Cole Jones", username: "@singlethought"),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight! * 20 / 812),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.02),
                child: Row(
                  children: [
                    Text(
                      "APPLIED",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: screenWidth! * 14 / 375,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.04),
                child: Row(
                  children: [
                    Text(
                      "Director",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth! * 17 / 375,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(flex: 1),
                    Image.asset(ReelFolioIcon.iconSmallArrowUpward)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.04,
                ),
                child: AppliedProfileWidget(
                    name: "Cole Jones", username: "@singlethought"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.04,
                ),
                child: AppliedProfileWidget(
                    name: "Cole Jones", username: "@singlethought"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.04,
                ),
                child: AppliedProfileWidget(
                    name: "Cole Jones", username: "@singlethought"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.04,
                    vertical: screenHeight! * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ],
          )),
    );
  }
}
