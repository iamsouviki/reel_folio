import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class AppliedProfileWidget extends StatelessWidget {
  const AppliedProfileWidget({
    Key? key,
    required this.name,
    required this.username,
  }) : super(key: key);

  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(ReelfolioImageAsset.profilePicture),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth! * 14 / 375,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                username,
                style: TextStyle(
                  color: ReelfolioColor.usernameColor,
                  fontSize: screenWidth! * 14 / 375,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Image.asset(ReelFolioIcon.iconDeny),
        Image.asset(ReelFolioIcon.iconInactive),
      ],
    );
  }
}
