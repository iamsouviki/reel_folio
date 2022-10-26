import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget TypeMessage(){
  return Container(
    color: primarybgcolor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      SizedBox(
        // height: 50,
        width: screenWidth! * 0.84,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 1),
          ),
          padding: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              filled: true,
              hintText: " Write your message here",
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
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