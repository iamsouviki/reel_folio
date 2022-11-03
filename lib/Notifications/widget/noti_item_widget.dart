import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget NotiItem(){
  return SizedBox(
    height: screenHeight!*0.1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(ReelfolioImageAsset.chatProfilePic),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // SizedBox(height:10),
              Text(
                "Cole Jones",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text("@singlethought",
                  style: TextStyle(color: tagcolor1, fontSize: 15)),
              Text("Wants to connect",
                  style: TextStyle(color: secondaryTextColor2, fontSize: 15)),
            ],
          ),
          const Spacer(),
          Row(children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined, color: searchTextcolor,)),
            // SizedBox(width: 5),
            IconButton(onPressed: (){}, icon: Icon(Icons.check_circle_outline_rounded, color: searchTextcolor,)),
          ],)
        ]),
        const Divider(
          color: filterbgcolor,
          thickness: 1,
        ),
      ],
    ),
  );
}