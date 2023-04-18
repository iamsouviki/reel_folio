import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../Api/config.dart';
import '../../Model/CategoryWiseProjectModel.dart';

Widget CrewingUpCard(Projects projects) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: screenWidth! * 10 / 375),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.2,
                ),
              ),
              height: screenHeight! / 6.5,
              width: screenWidth! / 1.5,
              child: Image.network(
                "$IMAGE_BASE_URL/${projects.thumbnail ?? ''}",
                fit: BoxFit.fill,
              ),
            ),
            projects.type == 'hiring'
                ? Positioned(
                    top: 10,
                    left: screenWidth! / 1.85,
                    child: Container(
                      height: 20,
                      width: 54,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: tagcolor1,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Hiring",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: screenWidth! / 1.5,
          child: Text(
            projects.title.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'GT-America-Extended-Bold',
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10,),
          width: screenWidth! / 1.5,
          height: 20,
          child: Text(
            projects.details.toString().replaceAll("\n", ""),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
  );
}
