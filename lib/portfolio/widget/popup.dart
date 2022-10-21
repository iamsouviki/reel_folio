import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

Widget PopUp(BuildContext context) {
  return Container(
    color: ReelfolioColor.bgColor,
    height: screenHeight! * 0.4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: Row(
            children: [
              Image.asset(ReelFolioIcon.iconBell),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: Row(
            children: [
              Image.asset(ReelFolioIcon.iconSettings),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: Row(
            children: [
              Image.asset(ReelFolioIcon.iconContacts),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: Row(
            children: [
              Image.asset(ReelFolioIcon.iconUpload),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Text(
                  "Copy portfolio link",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: Row(
            children: [
              Image.asset(ReelFolioIcon.saveButton),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
                child: Text(
                  "Saved",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
      ],
    ),
  );
}
