import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class OwnerWrappedUpWidget extends StatelessWidget {
  const OwnerWrappedUpWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenHeight! * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: Image.asset(ReelFolioIcon.iconArrowBackward)),
          Container(
            decoration: BoxDecoration(
              color: ReelfolioColor.bgColor,
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
    );
  }
}
