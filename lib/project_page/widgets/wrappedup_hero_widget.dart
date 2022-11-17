import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class WrappedUpHeroWidget extends StatelessWidget {
  const WrappedUpHeroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.05, vertical: screenWidth! * 0.05),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Image.asset(ReelfolioImageAsset.projectImage),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth! * 0.55, top: screenWidth! * 0.02),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 0.02,
                          vertical: screenWidth! * 0.01),
                      child: Image.asset(ReelFolioIcon.reelPlayButton)),
                ),
              ]),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth! * 0.48,
              ),
              Text(
                "PROJECT TITLE",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "GT-America-Extended-Bold",
                  fontSize: screenWidth! * 42 / 375,
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth! * 0.05),
                    child: Text(
                      softWrap: false,
                      "Logline: This a description of the \nproject trying to get people to join and \nwork on it.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Image.asset(
                    ReelFolioIcon.iconSaveSmall,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 0.02,
                          vertical: screenWidth! * 0.02),
                      child: Center(
                        child: Text(
                          "Request to tag",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
