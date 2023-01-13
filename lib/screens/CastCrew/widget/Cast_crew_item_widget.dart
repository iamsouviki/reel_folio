import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

// ignore: non_constant_identifier_names
Widget CastCrewItem() {
  return SizedBox(
    height: screenHeight!*0.1,
    child: Column(
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
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: secondaryTextColor2,
              // borderRadius: BorderRadius.circular(5),
            ),
            child: const Text("Director",style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),),
          )
        ]),
        const Divider(
          color: filterbgcolor,
          thickness: 1,
        ),
      ],
    ),
  );
}
