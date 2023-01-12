import 'package:flutter/material.dart';
import 'package:reel_folio/Contacts/contacts_main_list.dart';
import 'package:reel_folio/Notifications/notification.dart';
import 'package:reel_folio/Saved/saved_screen.dart';
import 'package:reel_folio/Portfolio/portfolio_edit.dart';
import 'package:reel_folio/Portfolio/portfolio_my.dart';
import 'package:reel_folio/settings/settings_main_page.dart';
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
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            child: Row(
              children: [
                Image.asset(ReelFolioIcon.iconBell),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
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
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsMainPage()),
              );
            },
            child: Row(
              children: [
                Image.asset(ReelFolioIcon.iconSettings),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
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
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
          indent: screenWidth! * 0.15,
          endIndent: screenWidth! * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth! * 0.05, top: screenHeight! * 0.01),
          child: InkWell(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactsMain(),
                ),
              );
            },
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
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedScreen(),
                ),
              );
            },
            child: Row(
              children: [
                Image.asset(ReelFolioIcon.saveButton),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
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
