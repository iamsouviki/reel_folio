import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget CrewingUpCard(i) {
  return Container(
      // height: screenHeight! * 0.08,
      padding: EdgeInsets.symmetric(horizontal: screenWidth! * 10 / 375),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ReelfolioImageAsset.homeProjectsImage2,
                fit: BoxFit.cover,
                height: screenHeight! * 0.15,
              ),
              SizedBox(height: screenHeight! * 10 / 812),
              Text(
                "Project Title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight! * 10 / 812),
              Text(
                "Project Owner",
                style: TextStyle(
                  color: secondaryTextColor2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
          padding: EdgeInsets.only(left:screenWidth!*0.35, top:15),
          child: Column(
            children: [
              Container(
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
              child: Text("Hiring", style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,),
              ),
              SizedBox(height: screenHeight! * 10 / 812),
              Container(
              //  padding: EdgeInsets.only(top: screenWidth! * 10 / 375),
              height: 20,
              width: 54,
              decoration: const BoxDecoration(
                color: tagcolor2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text("Union", style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,),
              ),
            ],
          )
          
        ),

        ],
      ));
}