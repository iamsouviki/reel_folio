import 'package:flutter/material.dart';
import 'package:reel_folio/Chat/chat_screen.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/util/asset.dart';

Widget ChatMainList(BuildContext context) {
  return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: screenHeight! * 0.11,
          // color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(ReelfolioImageAsset.chatProfilePic),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lindsay Sunada",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("Production Designer",
                                style: TextStyle(
                                    color: secondaryTextColor, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(ReelfolioImageAsset.messageicon),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                )
              ],
            ),
          )));
}
