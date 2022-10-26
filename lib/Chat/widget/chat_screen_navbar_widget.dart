import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';

Widget ChatScreenNavbar(BuildContext context) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top:10),
        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,),),
      ),


      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(ReelfolioImageAsset.chatProfilePic),
            ),
            SizedBox(height: 10),
            Text(
              "WEEKEND GETAWAY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "GT-America-Compressed-Regular",
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              "Project",
              style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Divider(
              color: secondaryTextColor,
            ),
          ],
        ),
      )
    ],
  );
}
