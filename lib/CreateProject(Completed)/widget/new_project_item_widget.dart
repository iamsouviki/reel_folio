import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';

Widget NewProject_Item() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              ReelfolioImageAsset.createProject,
              height: 50,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height:3),
                Text(
                  "Project Description",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButton(
              child: Text('Request to tag',
                  style: const TextStyle(
                      color: searchTextcolor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400)),
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                backgroundColor: Colors.white.withOpacity(0.08),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Divider(
          color: Colors.white.withOpacity(0.5),
          thickness: 0.5,
        )
      ],
    ),
  );
}
