import 'package:flutter/material.dart';
import 'package:reel_folio/Api/config.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../Model/ProjectListModel.dart';

Widget ProjectCard(ProjectDetails projectDetails) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
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
              height: screenHeight! / 3,
              width: screenWidth! / 1.5,
              child: Image.network(
                "$IMAGE_BASE_URL/${projectDetails.thumbnail ?? ''}",
                fit: BoxFit.cover,
                errorBuilder: (context, object, trace) => Container(),
              ),
            ),
            projectDetails.type == 'hiring'
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
        const SizedBox(height: 10),
        Text(
          projectDetails.logline.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: screenWidth! / 1.5,
          child: Text(
            projectDetails.title.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'GT-America-Extended-Bold',
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: screenWidth! * 0.3),
          width: screenWidth! / 2.7,
          height: 20,
          child: Text(
            projectDetails.details.toString().replaceAll("\n", ""),
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
