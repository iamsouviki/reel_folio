import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

String text = "Hello! I’d love to be considered as director for “weekend getaway.” Please go to my profile and check out my reel. thanks!";

Widget ReceiverWidget() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
            Padding(
              padding: EdgeInsets.only(top:screenHeight! * 0.04),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(ReelfolioImageAsset.chatProfilePic),
              ),
            ),
        //     const Spacer(),
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Lindsay Sunada",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth! * 0.7,
                      minWidth: screenWidth! * 0.3,
                    ),
                    decoration: BoxDecoration(
                      color: chatboxcolor2,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        text,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 15, height:1.5),
                      ),
                    )),
                SizedBox(height: 10),
                Text(
                  " 4 days ago",
                  style: TextStyle(color: secondaryTextColor2, fontSize: 13),
                ),
              ])
            ],
          ),
        ),
      ]));
}
