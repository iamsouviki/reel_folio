import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class ProjectPageAppbarWidget extends StatelessWidget {
  const ProjectPageAppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenHeight! * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ReelFolioIcon.iconArrowBackward),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.25),
            child: Container(
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
                  "Shoot in 30 Days",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
