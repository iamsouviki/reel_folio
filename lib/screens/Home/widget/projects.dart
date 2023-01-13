import 'package:flutter/material.dart';
import 'package:reel_folio/screens/Home/details.dart';
import 'package:reel_folio/screens/Home/homepage.dart';
import 'package:reel_folio/screens/Home/widget/projects_bottom_card.dart';
import 'package:reel_folio/screens/Home/widget/projects_top_card.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../../util/colors.dart';

Widget HomeProjects(BuildContext context) {
  id=1;
  return Container(
    padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.02,), 
      child: Column(
    children: [
      /// Project Page Heading
      ///
      const Text(
        "Reelfolio Picks",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      /// Horizontal Top Carousel
      Container(height: screenHeight! * 400 / 812, child: _horizontalList(4)),

      ///Crewing Up
      ///
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth! * 10 / 375),
        child: Row(
          children: [
            const Text(
              "CREWING UP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Detail()));
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  color: secondaryTextColor2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.white.withOpacity(0.1),
        indent: 10,
        endIndent: 10,
      ),
      SizedBox(height: screenHeight! * 10 / 812),
      // SizedBox(
      //   // height: 500,
      //   child: Expanded(child: _bottomhorizontalList(4))
      //   ),
      Expanded(child: _bottomhorizontalList(4))
    ],
  ));
}

ListView _horizontalList(int n) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(n, (i) => ProjectCard(i)),
  );
}

ListView _bottomhorizontalList(int n) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(n, (i) => CrewingUpCard(i)),
  );
}
