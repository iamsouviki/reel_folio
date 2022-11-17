import 'package:flutter/material.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class AccountPageAppBarWidget extends StatelessWidget {
  const AccountPageAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenWidth! * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ReelFolioIcon.iconSmallArrowBackward),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.12),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth! * 15 / 375,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
