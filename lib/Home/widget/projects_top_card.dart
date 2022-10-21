import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget ProjectCard(i) {
  return Container(
    padding: EdgeInsets.only(top:15),
    // height: screenHeight! * 0.9,
    child: Stack(
      // alignment: Alignment.topCenter,
      children: [
        Container(
          child: Image.asset(
            ReelfolioImageAsset.homeProjectsImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left:screenWidth!*0.7, top:15),
          child: Container(
              // padding: EdgeInsets.only(left: screenWidth! * 0.2),
              height: 20,
              width: 54,
              decoration: const BoxDecoration(
                color: tagcolor1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text("Hiring", style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,),),
        ),
        Container(
          // height: screenHeight! * 0.1,
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 40 / 375),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight! * 0.27),
              const Text(
                "30 day until shoot",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "WEEKEND\nGETAWAY",
                style: TextStyle(
                  fontFamily: 'GT-America-Expanded-Bold',
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:screenWidth!*0.3),
                height: screenHeight! * 0.05,
                child: Text("This a preview of log line\n and another ...", style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),)
              ),
              
            ],
          ),
        )
      ],
    ),
  );
}