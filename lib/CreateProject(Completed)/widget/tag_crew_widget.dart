import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';

Widget tagCrewWidget(){
  return Column(
    children: [
      Row(
        children: [
          Image.asset(ReelfolioImageAsset.chatProfilePic, height: 25),
          SizedBox(width: 15,),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("William Erwin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: searchBarcolor,
                  ),
                  child: Text("Director",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ]
          )
        ],
      ),
      Divider(
        color: Colors.white.withOpacity(0.3),
      )
    ],
  );
}