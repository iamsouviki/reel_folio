import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget TypeMessage(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    color: primarybgcolor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Container(
        
        // height: 50,
        width: screenWidth! * 0.82,
        child: Container(
          // padding:EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
          ),
          // padding: EdgeInsets.all(5),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              filled: true,
              hintText: " Write your message here",
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: secondaryTextColor,
              ),
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        )
      ),
      Container(
        width: screenWidth! * 0.1,
        decoration: BoxDecoration(
          color: secondaryTextColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_upward,
            color: Colors.black,
          ),
        ),
      )
    ],)
  );
}