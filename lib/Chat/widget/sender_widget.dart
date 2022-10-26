import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget SenderWidget(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: screenWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Padding(
          padding: const EdgeInsets.only(right:20.0),
          child: Text("Lindsay Sunada", style: TextStyle(color: Colors.white, fontSize: 13),),
        ),
        SizedBox(height: 10),
        Container(
          constraints: BoxConstraints(
            maxWidth: screenWidth! * 0.7,
            minWidth: screenWidth! * 0.3,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Hey! Okay, Thanks Thanks ", textAlign: TextAlign.end, style: TextStyle(fontSize: 15, height:1.5),),
          )
        ),

        SizedBox(height: 10),
        Text("4 days ago", style: TextStyle(color: secondaryTextColor2, fontSize: 13),),
      ]
    )
  );
}