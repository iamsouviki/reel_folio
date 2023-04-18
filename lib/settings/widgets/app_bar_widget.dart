import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsAppBarWidget extends StatelessWidget {
  const SettingsAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenWidth! * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset(ReelFolioIcon.iconArrowBackward),
          ),
          Text(
            title,
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
