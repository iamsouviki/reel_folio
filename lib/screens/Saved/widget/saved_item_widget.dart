import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';

Widget SavedItem() {
  return Container(
    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(ReelfolioImageAsset.chatProfilePic),
      ),
      SizedBox(width: 20),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:10),
          Text(
            "Lindsay Sunada",
            style: TextStyle(color: Colors.white,  fontSize: 16),
          ),
          SizedBox(height:5),
          Text("Production Designer",
              style: TextStyle(color: secondaryTextColor, fontSize: 15)),
        ],
      ),
    ]),
  );
}
