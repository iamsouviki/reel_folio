import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget NewMessageList(){
  return Container(
      height: screenHeight! * 0.11,
      child: Row(children: [

        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(ReelfolioImageAsset.chatProfilePic),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lindsay Sunada",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text("@mattsaff",
                style: TextStyle(color: secondaryTextColor2, fontSize: 15)),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.check, color: Colors.white, size: 25,)),
      ],)
    );
}