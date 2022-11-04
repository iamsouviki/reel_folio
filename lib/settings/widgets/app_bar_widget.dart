import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsAppBarWidget extends StatelessWidget {
  const SettingsAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenWidth! * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ReelFolioIcon.iconArrowBackward),
          Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth! * 15 / 375,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Support",
            style: TextStyle(
              color: ReelfolioColor.usernameColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
